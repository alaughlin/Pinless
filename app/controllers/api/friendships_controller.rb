class Api::FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.new(friendship_params)
    @friend = User.find(@friendship.friend_id)

    if @friendship.save
      render json: {}
    else
      render json: @friendship.errors.full_messages
    end
  end

  def destroy
    @friend = User.find(params[:friendship][:friend_id])
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