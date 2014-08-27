class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)
    @reverse_friendship = Friendship.new({user_id: params[:friendship][:friend_id], friend_id: params[:friendship][:user_id]})
    @request = FriendRequest.find(params[:request_id])
    
    if @friendship.save && @reverse_friendship.save
      @request.destroy
      redirect_to user_url(current_user)
    else
      flash[:errors] = @friendship.errors.full_messages
      redirect_to user_url(current_user)
    end
  end

  def destroy

  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
