class UsersController < ApplicationController
  before_filter :ensure_signed_in, only: [:show]

  def show
    @user = User.find(params[:id])
    @boards = @user.boards
    @cards = @user.cards
  end

  def new
    @user = User.new
  end
end
