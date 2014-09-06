json.array! @users do |user|
  json.(user, :id, :username, :created_at, :updated_at)
  json.set!(:avatar_large, user.avatar.url(:large))
  json.set!(:avatar_thumb, user.avatar.url(:thumb))
end