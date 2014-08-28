class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)
    @friend = User.find(@friendship.friend_id)
    
    if @friendship.save
      redirect_to user_url(current_user)
    else
      flash[:errors] = @friendship.errors.full_messages
      redirect_to user_url(current_user)
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friend = @friendship.friend
    @friendship_reverse = Friendship.find_by(user_id: @friendship.friend_id, friend_id: @friendship.user_id)

    if @friendship.destroy && @friendship_reverse.destroy
      redirect_to user_url(@friend)
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
