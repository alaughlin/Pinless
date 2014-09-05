class Api::UsersController < ApplicationController
before_filter :ensure_signed_in, only: [:show]

  def show
    @user = User.find(params[:id])

    render :show
  end

  def friends
    @user = User.find(params[:id])
    @friends = @user.friends

    @friends = @friends.select { |friend| @user.friendship_status(friend) == "friends"}

    render :index
  end

  def get_current_user
    @user = current_user
    render :show
  end
end