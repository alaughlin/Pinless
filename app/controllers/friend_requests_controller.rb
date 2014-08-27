class FriendRequestsController < ApplicationController
  def create
    @friend_request = FriendRequest.new(friend_request_params)
    @user = User.find(params[:friend_request][:requestee_id])

    if @friend_request.save
      redirect_to user_url(@user)
    else
      flash[:errors] = @friend_request.errors.full_messages
      redirect_to user_url(@user)
    end
  end

  def destroy
    @request = FriendRequest.find(params[:id])
    @request.destroy

    redirect_to user_url(current_user)
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:requester_id, :requestee_id)
  end
end
