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
end