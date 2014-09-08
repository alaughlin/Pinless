class Api::BoardLikesController < ApplicationController
  before_filter :check_if_signed_in
  
  def board_like
    @board = Board.find(params[:board_id])

    if current_user.likes_board?(@board)
      @board_like = BoardLike.find_by(user_id: current_user.id, board_id: @board.id)

      @board_like.destroy
      render json: {action: "destroyed"}
    else
      @board_like = BoardLike.new
      @board_like.board_id = @board.id
      @board_like.user_id = current_user.id

      if @board_like.save
        render json: {action: "created"}
      else
        render json: {error: "You already like this board!"}, status: 422
      end
    end
  end
end