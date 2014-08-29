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

  def liked_cards
    @user = User.find(params[:id])
    @cards = @user.liked_cards

    render :index
  end
end