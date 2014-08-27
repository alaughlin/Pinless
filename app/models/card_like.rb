class CardLike < ActiveRecord::Base
  validates :card_id, :user_id, presence: true
  validates :card_id, uniqueness: { scope: :user_id }

  belongs_to :card
  belongs_to :user
end
