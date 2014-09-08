class Api::FeedsController < ApplicationController
  before_filter :check_if_signed_in
  
  def index
    @boards = current_user.liked_boards
    @cards = []
    @boards.each { |board| @cards.concat(board.cards) }

    render 'api/cards/index'
  end
end