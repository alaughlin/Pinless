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
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    
    if @board.save
      redirect_to user_url(current_user)
    else
      @board = Board.new
      flash[:errors] = @board.errors.full_messages
      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :description, :avatar, :public)
  end
end
