class Api::UsersController < ApplicationController
  before_filter :ensure_signed_in, only: [:show, :friends]

  def show
    begin
      @user = User.find(params[:id])
      render :show
    rescue ActiveRecord::RecordNotFound
      render json: { error: "You seem lost.  Is everything alright?" }
    end
  end

  def friends
    @user = User.find(params[:id])
    @users = @user.friends

    @users = @users.select { |user| @user.friendship_status(user) == "friends" }

    render :index
  end

  def get_current_user
    @user = current_user
    render :show
  end

  def update
    @user = current_user
    @user.update_attribute(:avatar, params[:user][:avatar])
    render :show
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :avatar)
  end
end