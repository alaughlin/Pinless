class CardLikesController < ApplicationController
  def create
    @card_like = CardLike.new(card_like_params)
    
    if @card_like.save
      redirect_to card_url(@card_like.card)
    else
      flash[:errors] = ["You already like this board!"]
      redirect_to card_url(@card_like.card)
    end
  end

  def destroy
    @card_like = CardLike.where("card_id = ? AND user_id = ?", params[:card_like][:card_id], params[:card_like][:user_id]).first
    @card = Card.find(params[:card_like][:card_id])
    @card_like.destroy

    redirect_to card_url(@card)

  end

  private

  def card_like_params
    params.require(:card_like).permit(:user_id, :card_id)
  end
end
