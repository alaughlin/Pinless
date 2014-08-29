json.array! @boards do |board|
  image = board.avatar.url
  user_username = board.user.username

  json.(board, :id, :title, :user_id, :created_at, :updated_at)
  json.set!(:image, image)
  json.set!(:user_username, user_username)
end