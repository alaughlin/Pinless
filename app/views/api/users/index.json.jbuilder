json.array! @friends do |friend|
  avatar = friend.avatar.url

  json.(friend, :id, :username, :created_at, :updated_at)
  json.set!(:avatar, avatar)
end