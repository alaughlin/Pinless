class Board < ActiveRecord::Base
  validates :title, :user_id, :public, presence: true

  belongs_to :user
  has_many :cards, class_name: "Card", foreign_key: "board_id"
end
