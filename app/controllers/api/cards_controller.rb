class Api::CardsController < ApplicationController
  def show
    @card = Card.includes(:board, :user).find(params[:id])

    render :show
  end
end