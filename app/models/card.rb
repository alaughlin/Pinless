class Card < ActiveRecord::Base
  validates :title, :board_id, :user_id, :img_url, presence: true

  belongs_to :board
  belongs_to :user
end
