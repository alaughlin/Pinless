class Card < ActiveRecord::Base
  validates :title, :board_id, :user_id, :image, presence: true

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :board
  belongs_to :user
end
