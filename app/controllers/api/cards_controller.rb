class Api::CardsController < ApplicationController
  def show
    @card = Card.includes(:board, :user).find(params[:id])

    render :show
  end

  def index
    @user = User.find(params[:user_id])
    @cards = @user.cards

    render :index
  end

  def create
    @card = Card.new(card_params)
    @card.user_id = current_user.id

    puts @card

    if @card.save
      render json: @card
    end
  end

  def liked_cards
    @user = User.find(params[:id])
    @cards = @user.liked_cards

    render :index
  end

  private

  def card_params
    params.require(:card).permit(:title, :image, :description, :board_id)
  end
end