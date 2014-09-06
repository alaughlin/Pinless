class Card < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_card, :against => [:title, :description]

  validates :title, :board_id, :user_id, :image, presence: true

  has_attached_file :image, :styles => { :large => "800x500>", :thumb => "150" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :board
  belongs_to :user
end
