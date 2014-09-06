class Api::SearchController < ApplicationController
  def search
    model = params[:m]
    terms = params[:q]

    if model == "card"
      @cards = Card.search_by_card(terms)

      render 'api/cards/index'
    elsif model == "board"
      @boards = Board.search_by_board(terms)
      @boards = @boards.select { |board| board.public || board.user == current_user }

      render 'api/boards/index'
    else
      @users = User.search_by_user(terms)

      render 'api/users/index'
    end
  end
end