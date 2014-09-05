friendship_status = current_user.friendship_status(user.id)

json.(user, :id, :username, :created_at, :updated_at)
json.set!(:avatar, user.avatar.url)
json.set!(:friendship_status, friendship_status)

if user == current_user
  json.requests user.friend_requests do |request|
    username = request.user.username
    avatar = request.user.avatar.url

    json.(request, :id, :user_id)
    json.set!(:username, username)
    json.set!(:avatar, avatar)
  end
end