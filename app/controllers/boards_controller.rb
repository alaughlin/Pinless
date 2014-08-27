class BoardsController < ApplicationController
  def index
    @boards = Board.where(public: true).order(:title)
  end

  def show
    @board = Board.find(params[:id])
    @liked = BoardLike.where("board_id = ? AND user_id = ?", @board.id, current_user.id).first
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
