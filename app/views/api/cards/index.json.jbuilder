json.array! @cards do |card|
  json.(card, :id, :title, :description, :user_id, :board_id, :created_at, :updated_at)
  json.set!(:image_large, card.image.url(:large))
  json.set!(:image_thumb, card.image.url(:thumb))
  json.set!(:user_username, card.user.username)
  json.set!(:board_title, card.board.title)
  json.set!(:close_button, asset_path("close.png"))
  json.set!(:likes_card, current_user.likes_card?(card))
  json.set!(:heart, asset_path("heart.png"))
end