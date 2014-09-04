class Api::FeedsController < ApplicationController
  def index
    @boards = current_user.liked_boards
    @cards = []
    @boards.each { |board| @cards.concat(board.cards) }

    render 'api/cards/index'
  end
end