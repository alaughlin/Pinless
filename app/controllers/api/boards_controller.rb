class Api::BoardsController < ApplicationController
  def show
    @board = Board.includes(:cards).find(params[:id])

    render :show
  end

  def index
    @user = User.find(params[:user_id])
    @boards = @user.boards

    render :index
  end

  def liked_boards
    @user = User.find(params[:id])
    @boards = @user.liked_boards

    render :index
  end
end