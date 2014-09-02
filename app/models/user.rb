class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :username, :password_digest, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :boards, class_name: "Board", foreign_key: :user_id
  has_many :board_likes, class_name: "BoardLike", foreign_key: :user_id
  has_many :card_likes, class_name: "CardLike", foreign_key: :user_id
  has_many :friendships, class_name: "Friendship", foreign_key: :user_id
  has_many :friends, through: :friendships, source: :friend
  has_many :liked_boards, through: :board_likes, source: :board
  has_many :cards, through: :boards, source: :cards
  has_many :liked_cards, through: :card_likes, source: :card

  after_initialize :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    user && user.has_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save

    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def has_password?(password)
    pw = BCrypt::Password.new(self.password_digest)
    pw.is_password?(password)
  end

  def likes_board?(board)
    self.liked_boards.exists?(board)
  end

  def likes_card?(card)
    self.liked_cards.exists?(card)
  end

  def are_friends?(friend)
    self.friends.exists?(friend) && friend.friends.exists?(self)
  end

  def friend_requests
    incoming = Friendship.find_by_sql(<<-SQL)
      SELECT
        *
      FROM
        friendships
      WHERE
        friend_id = #{self.id}
    SQL

    requests = Friendship.find_by_sql(<<-SQL)
      SELECT
        incoming_requests.*
      FROM
        (SELECT
          *
        FROM
          friendships
        WHERE
          friend_id = #{self.id}) as incoming_requests
      LEFT OUTER JOIN
        friendships
      ON
        friendships.user_id = incoming_requests.friend_id
      WHERE
        friendships.friend_id = incoming_requests.user_id
    SQL

    incoming - requests
  end

  def self.process_uri(uri)
    open(uri, allow_redirections: :safe) do |r|
      r.base_uri.to_s
    end
  end

  def self.find_or_create_by_fb_auth_hash(auth_hash)
    user = self.find_by(uid: auth_hash[:uid], provider: auth_hash[:provider])

    unless user
      user = self.create!(
        uid: auth_hash[:uid],
        provider: auth_hash[:provider],
        username: auth_hash[:info][:name],
        password_digest: SecureRandom::urlsafe_base64(16),
        avatar: self.process_uri(auth_hash[:info][:image])
      )
    end

    user
  end

  def friendship_status(id)
    user = User.find(id)

    if self.are_friends?(user)
      return "friends"
    else
      requests = user.friend_requests
      requests.each { |request| return "pending" if request.user_id == self.id }
    end

    "not_friends"
  end
end
