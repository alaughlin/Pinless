class Api::SearchController < ApplicationController
  def search
    model = params[:m]
    terms = params[:q]

    if model == "card"
      @cards = Card.search_by_card(terms)

      render 'api/cards/index'
    else
      @boards = Board.search_by_board(terms)

      render 'api/boards/index'
    end
  end
end