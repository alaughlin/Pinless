class Api::BoardsController < ApplicationController
  def show
    @board = Board.includes(:cards).find(params[:id])

    render json: @board 
  end
end