json.array! @friends do |friend|
  image = friend.avatar.url

  json.(friend, :id, :username, :created_at, :updated_at)
  json.set!(:image, image)
end