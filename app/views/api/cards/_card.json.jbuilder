json.set!(:close_button, asset_path("close.png"))

image = card.image.url
board_title = card.board.title
user_username = card.user.username

json.(card, :id, :title, :user_id, :board_id, :image, :board_id, :user_id, :created_at, :updated_at)
json.set!(:board_title, board_title)
json.set!(:user_username, user_username)