json.(board, :id, :title, :description, :user_id, :created_at, :updated_at)
json.set!(:username, board.user.username)
json.set!(:likes_board, current_user.likes_board?(board))
json.set!(:user_username, Board.find(board.id).user.username)
json.set!(:avatar_large, board.avatar.url(:large))
json.set!(:avatar_thumb, board.avatar.url(:thumb))
json.set!(:user_avatar, board.user.avatar.url(:thumb));

json.cards board.cards do |card|
  json.partial! 'api/cards/card', card: card
end