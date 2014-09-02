class Api::UsersController < ApplicationController
before_filter :ensure_signed_in, only: [:show]

  def show
    @user = User.includes(:boards).find(params[:id])
    # if @user == current_user
    #   @friend_requests = @user.friend_requests
    # end

    # @are_friends = current_user.are_friends?(@user)

    # if @are_friends
    #   @friendship = Friendship.find_by(user_id: current_user.id, friend_id: @user.id)
    # end

    # @pending_request = Friendship.find_by(user_id: current_user.id, friend_id: @user.id) && !(Friendship.find_by(user_id: @user.id, friend_id: current_user.id))
    render :show
  end

  def friends
    @user = User.find(params[:id])
    @friends = @user.friends

    render :index
  end

  def get_current_user
    @user = current_user
    render :show
  end

  def friend_requests
    
  end

  def check_for_request
    requested_yet = false
    @user = User.find(params[:id])
    @requests = @user.friend_requests
    @requests.each { |request| requested_yet = true if request.user_id == current_user.id }
    
    if requested_yet
      render json: true
    else
      render json: false
    end
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)

  #   if @user.save
  #     sign_in!(@user)
  #   else
  #     flash[:errors] = @user.errors.full_messages
  #     render :new
  #   end
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:username, :password, :avatar)
  # end
end