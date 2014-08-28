class BoardsController < ApplicationController
  def index
    @boards = Board.where(public: true).order(:title)
  end

  def show
    @board = Board.find(params[:id])
    @liked = current_user.likes_board?(@board)

    if @liked
      @board_like = BoardLike.find_by(board_id: @board.id, user_id: current_user.id)
    end
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
