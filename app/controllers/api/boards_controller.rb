class Api::BoardsController < ApplicationController
  def show
    @board = Board.includes(:cards).find(params[:id])

    if @board.public || @board.user == current_user
      render :show
    else
      render json: {error: "Yeah, not happening"}
    end
  end

  def index
    @user = User.find(params[:user_id])
    @boards = @user.boards

    @boards = @boards.select { |board| board.public || board.user == current_user}

    render :index
  end

  def create
    @board = current_user.boards.new(board_params)

    if @board.save
      render :show
    else
      render json: {error: @board.errors.full_messages}
    end
  end

  def liked_boards
    @user = User.find(params[:id])
    @boards = @user.liked_boards

    render :index
  end

  private

  def board_params
    params.require(:board).permit(:title, :avatar, :description, :public)
  end
end