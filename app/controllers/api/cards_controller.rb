class Api::CardsController < ApplicationController
  before_filter :check_if_signed_in
  
  def show
    @card = Card.includes(:board, :user).find(params[:id])

    render :show
  end

  def index
    @user = User.find(params[:user_id])
    @cards = @user.cards

    render :index
  end

  def board_cards
    @board = Board.find(params[:id])
    @cards = @board.cards.take(10)

    render :index
  end

  def create
    @card = current_user.cards.new(card_params)
    @card.image = URI.parse(params[:image_url]) if params[:image_url]

    if @card.save
      render :show
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