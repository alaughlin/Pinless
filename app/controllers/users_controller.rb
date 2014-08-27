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

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in!(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :avatar)
  end
end
