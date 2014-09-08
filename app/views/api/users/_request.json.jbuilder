json.(request, :id, :user_id)
json.set!(:username, request.user.username)
json.set!(:avatar_large, request.user.avatar.url(:large))
json.set!(:avatar_thumb, request.user.avatar.url(:thumb))