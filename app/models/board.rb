class Board < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_board, :against => [:title, :description]

  validates :title, :user_id, :avatar, presence: true
  validates :public, inclusion: { in: [true, false] }

  has_attached_file :avatar, :styles => { :large => "800x500>", :thumb => "150" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_many :cards, class_name: "Card", foreign_key: :board_id
  has_many :board_likes, class_name: "BoardLike", foreign_key: :board_id
end
