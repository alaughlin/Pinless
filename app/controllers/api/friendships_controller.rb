class Api::FriendshipsController < ApplicationController
  before_filter :check_if_signed_in

  def create
    @friendship = current_user.friendships.new(friendship_params)
    @friend = User.find(@friendship.friend_id)

    if @friendship.save
      render json: {}
      if current_user.are_friends?(@friend)
        Pusher["private-#{@friend.id}"].trigger('friendship_created', {id: current_user.id})
      else current_user.are_friends?(@friend)
        Pusher["private-#{@friend.id}"].trigger('friend_request', {
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
      end
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
      Pusher["private-#{@friend.id}"].trigger('deleted_friendship', {friend_id: current_user.id})
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