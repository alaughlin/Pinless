class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :username, :password_digest, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true

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
end
