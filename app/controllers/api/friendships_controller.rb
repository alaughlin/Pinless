class Api::FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)

    if @friendship.save
      render json: @friendship
    else
      render json: @friendship.errors.full_messages
    end
  end

  def destroy
    @friendship = current_user.friendships.where(friend_id = params[friend_id]).first
    puts @friendship
    @friend = @friendship.friend
    @friendship_reverse = Friendship.find_by(user_id: @friendship.friend_id, friend_id: @friendship.user_id)

    if @friendship.destroy && @friendship_reverse.destroy
      render json: "destroyed"
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end