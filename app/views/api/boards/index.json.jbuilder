json.array! @boards do |board|
  avatar = board.avatar.url(:large)
  user_username = board.user.username
  likes_board = current_user.likes_board?(board)
  username = board.user.username

  json.(board, :id, :title, :user_id, :description, :avatar, :created_at, :updated_at)
  json.set!(:avatar, avatar)
  json.set!(:user_username, user_username)
  json.set!(:likes_board, likes_board)
  json.set!(:username, username)
  json.set!(:close_button, asset_path("close.png"))
end