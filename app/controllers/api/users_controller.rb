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
end