json.array! @users do |user|
  avatar = user.avatar.url

  json.(user, :id, :username, :created_at, :updated_at)
  json.set!(:avatar, avatar)
end