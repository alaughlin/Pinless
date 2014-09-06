json.(board, :id, :title, :description, :user_id, :created_at, :updated_at)
json.set!(:username, username)
json.set!(:close_button, asset_path("close.png"))
json.set!(:likes_board, current_user.likes_board?(board))
json.set!(:username, Board.find(board.id).user.username)
json.set!(:avatar_large, board.avatar.url(:large))
json.set!(:avatar_thumb, board.avatar.url(:thumb))

json.cards board.cards do |card|
  json.(card, :id, :title, :user_id, :board_id, :board_id, :user_id, :created_at, :updated_at)
  json.set!(:board_title, card.board.title)
  json.set!(:user_username, card.user.username)
  json.set!(:image_large, card.image.url(:large))
  json.set!(:image_thumb, card.image.url(:thumb))
end