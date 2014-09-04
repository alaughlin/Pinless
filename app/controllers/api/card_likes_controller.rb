class Api::CardLikesController < ApplicationController
  def card_like
    @card = Card.find(params[:card_id])

    if current_user.likes_card?(@card)
      @card_like = CardLike.find_by(user_id: current_user.id, card_id: @card.id)

      @card_like.destroy
      render json: {action: "destroyed"}
    else
      @card_like = CardLike.new
      @card_like.card_id = @card.id
      @card_like.user_id = current_user.id

      if @card_like.save
        render json: {action: "created"}
      else
        render json: {error: "You already like this card!"}, status: 422
      end
    end
  end
end