class Api::FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)
    @friend = User.find(@friendship.friend_id)

    if @friendship.save
      render json: @friend
    else
      render json: @friendship.errors.full_messages
    end
  end

  def destroy
    @friendship = current_user.friendships.where(friend_id = params[friend_id]).first
    puts @friendship
    @friendship_reverse = Friendship.find_by(user_id: @friendship.friend_id, friend_id: @friendship.user_id)
    puts @friendship_reverse

    if @friendship.destroy && @friendship_reverse.destroy
      render json: {}
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end