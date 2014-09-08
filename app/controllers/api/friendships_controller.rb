class Api::FriendshipsController < ApplicationController
  before_filter :check_if_signed_in

  def create
    @friendship = current_user.friendships.new(friendship_params)
    @friend = User.find(@friendship.friend_id)

    if @friendship.save
      render json: {}
      Pusher["private-#{@friend.id}"].trigger('new_message', {
        :from => current_user.username,
        :subject => " has sent a friend request",
        :request => {
          avatar_large: current_user.avatar(:large),
          avatar_small: current_user.avatar(:small),
          id: @friendship.id,
          user_id: current_user.id,
          username: current_user.username
        }
      })
    else
      render json: @friendship.errors.full_messages
    end
  end

  def destroy
    @friend = User.find(params[:friend_id])
    @friendship = current_user.friendships.find_by(friend_id: @friend.id)
    @friendship_reverse = @friend.friendships.find_by(friend_id: current_user.id)

    if @friendship.destroy && @friendship_reverse.destroy
      render json: {}
    else
      render json: {errors: @friendship.errors.full_messages}
    end
  end

  def destroy_request
    @user = User.find(params[:friendship][:friend_id])
    @friendship = @user.friendships.find_by(friend_id: current_user.id)

    if @friendship.destroy
      render json: {}
    else
      render json: {errors: @friendship.errors.full_messages}
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end