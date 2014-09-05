friendship_status = current_user.friendship_status(user.id)

json.(user, :id, :username, :created_at, :updated_at)
json.set!(:avatar, user.avatar.url)
json.set!(:friendship_status, friendship_status)