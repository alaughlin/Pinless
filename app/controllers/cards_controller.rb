class CardsController < ApplicationController
  def show
    @card = Card.find(params[:id])
    @board = @card.board
    @user = @card.user
  end

  def new
    @card = Card.new
    @board = Board.find(params[:board_id])
  end

  def create
    @card = Card.new(card_params)
    @card.user_id = current_user.id

    if @card.save
      redirect_to user_url(current_user)
    else
      @card = Card.new
      flash[:errors] = @card.errors.full_messages
      render :new
    end
  end

  private

  def card_params
    params.require(:card).permit(:title, :img_url, :description, :board_id)
  end
end
