friendship_status = current_user.friendship_status(user.id)

json.(user, :id, :username, :created_at, :updated_at)
json.set!(:image, user.avatar.url)
json.set!(:friendship_status, friendship_status)

# sjson.boards user.boards do |board|
#   image = board.avatar.url
#   user_username = board.user.username

#   json.(board, :id, :title, :user_id, :created_at, :updated_at)
#   json.set!(:user_username, user_username)
#   json.set!(:image, image)
# end

# json.cards user.cards do |card|
#   image = card.image.url
#   board_title = card.board.title
#   user_username = card.user.username

#   json.(card, :id, :title, :user_id, :board_id, :image, :board_id, :user_id, :created_at, :updated_at)
#   json.set!(:board_title, board_title)
#   json.set!(:user_username, user_username)
# end