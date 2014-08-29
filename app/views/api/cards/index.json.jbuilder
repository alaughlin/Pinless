json.array! @cards do |card|
  image = card.image.url
  user_username = card.user.username
  board_title = card.board.title

  json.(card, :id, :title, :description, :user_id, :board_id, :created_at, :updated_at)
  json.set!(:image, image)
  json.set!(:user_username, user_username)
  json.set!(:board_title, board_title)
end