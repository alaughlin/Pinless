json.array! @cards do |card|
  image = card.image.url
  user_username = card.user.username
  board_title = card.board.title
  likes_card = current_user.likes_card?(card)

  json.(card, :id, :title, :description, :user_id, :board_id, :created_at, :updated_at)
  json.set!(:image, image)
  json.set!(:user_username, user_username)
  json.set!(:board_title, board_title)
  json.set!(:close_button, asset_path("close.png"))
  json.set!(:likes_card, likes_card)
  json.set!(:heart, asset_path("heart.png"))
end