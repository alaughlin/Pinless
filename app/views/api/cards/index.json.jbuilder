json.array! @cards do |card|
  image = card.image.url
  user_username = card.user.username

  json.(card, :id, :title, :description, :user_id, :created_at, :updated_at)
  json.set!(:image, image)
  json.set!(:user_username, user_username)
end