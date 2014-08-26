class BoardsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @boards = @user.boards
  end

  def show
    @board = Board.find(params[:id])
    @cards = @board.cards
  end

  def new
    @board = Board.new
  end

  def create
    fail

  end

  private

  def board_params
    param.require(:board).permit(:title, :description, :img_url, :public)
  end
end
