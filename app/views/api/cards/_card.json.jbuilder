json.set!(:close_button, asset_path("close.png"))
json.set!(:heart, asset_path("heart.png"))

image = card.image.url(:large)
board_title = card.board.title
user_username = card.user.username
likes_card = current_user.likes_card?(card)

json.(card, :id, :title, :user_id, :board_id, :image, :board_id, :user_id, :description, :created_at, :updated_at)
json.set!(:board_title, board_title)
json.set!(:user_username, user_username)
json.set!(:likes_card, likes_card)