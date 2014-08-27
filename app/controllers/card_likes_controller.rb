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
    @card_like = CardLike.find(params[:id])
    @card = @card_like.card
    @card_like.destroy

    redirect_to card_url(@card)

  end

  private

  def card_like_params
    params.require(:card_like).permit(:user_id, :card_id)
  end
end
