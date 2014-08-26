class BoardsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @boards = @user.boards
  end

  def show
    @board = Board.find(params[:id])
    @cards = @board.cards
  end
end
