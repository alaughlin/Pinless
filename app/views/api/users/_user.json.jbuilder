json.(user, :id, :username, :created_at, :updated_at)
json.set!(:avatar_large, user.avatar.url(:large))
json.set!(:avatar_thumb, user.avatar.url(:thumb))
json.set!(:friendship_status, current_user.friendship_status(user.id))

if user == current_user
  json.requests user.friend_requests do |request|
    json.partial! 'api/users/request', request: request
  end
end