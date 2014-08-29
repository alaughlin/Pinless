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
end