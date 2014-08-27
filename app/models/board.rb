class Board < ActiveRecord::Base
  validates :title, :user_id, :avatar, presence: true
  validates :public, inclusion: { in: [true, false] }

  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_many :cards, class_name: "Card", foreign_key: "board_id"
end
