json.array! @friends do |friend|
  image = friend.avatar.url(:large)

  json.(friend, :id, :username, :created_at, :updated_at)
  json.set!(:image, image)
end