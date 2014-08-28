class CardsController < ApplicationController
  def show
    @card = Card.find(params[:id])
    @liked = current_user.likes_card?(@card)
  end

  def new
    @card = Card.new
    @board = Board.find(params[:board_id])
  end

  def create
    @card = Card.new(card_params)
    @card.user_id = current_user.id

    if @card.save
      redirect_to card_url(@card)
    else
      @card = Card.new
      flash[:errors] = @card.errors.full_messages
      render :new
    end
  end

  private

  def card_params
    params.require(:card).permit(:title, :image, :description, :board_id)
  end
end
