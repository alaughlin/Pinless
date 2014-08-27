class BoardLikesController < ApplicationController

  def create
    @board_like = BoardLike.new(board_like_params)
    
    if @board_like.save
      redirect_to board_url(@board_like.board_id)
    else
      flash[:errors] = ["You already like this board!"]
      redirect_to board_url(@board_like.board_id)
    end
  end

  private

  def board_like_params
    params.require(:board_like).permit(:user_id, :board_id)
  end
end