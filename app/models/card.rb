class Card < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title, :description]

  validates :title, :board_id, :user_id, :image, presence: true

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/, :styles => { :large => "800x500" }

  belongs_to :board
  belongs_to :user
end
