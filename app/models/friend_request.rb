class FriendRequest < ActiveRecord::Base
  validates :requester_id, :requestee_id, presence: true
  validates :requester_id, uniqueness: { scope: :requestee_id, message: "You already sent this person a friend request!" }

  belongs_to :requester, class_name: "User", foreign_key: :requester_id
end