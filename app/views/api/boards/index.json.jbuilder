json.array! @boards do |board|
  json.(board, :id, :title, :user_id, :description, :avatar, :created_at, :updated_at)
  json.set!(:avatar_large, board.avatar.url(:large))
  json.set!(:avatar_thumb, board.avatar.url(:thumb))
  json.set!(:user_username, board.user.username)
  json.set!(:likes_board, current_user.likes_board?(board))
  json.set!(:username, board.user.username)
  json.set!(:close_button, asset_path("close.png"))
end