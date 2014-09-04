json.set!(:close_button, asset_path("close.png"))
username = board.user.username

board = Board.find(board.id)
likes_board = current_user.likes_board?(board)
json.set!(:likes_board, likes_board)

username = board.user.username
json.set!(:username, username)

avatar = board.image.url(:large)
json.(board, :id, :title, :description, :user_id, :created_at, :updated_at)
json.set!(:username, username)
json.set!(:avatar, avatar)

json.cards board.cards do |card|
  image = card.image.url(:large)
  board_title = card.board.title
  user_username = card.user.username

  json.(card, :id, :title, :user_id, :board_id, :image, :board_id, :user_id, :created_at, :updated_at)
  json.set!(:board_title, board_title)
  json.set!(:user_username, user_username)
end