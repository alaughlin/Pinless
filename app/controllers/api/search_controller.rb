class Api::SearchController < ApplicationController
  def search
    results = PgSearch.multisearch(params[:q])
    @cards = []

    results.each { |result| @cards << Card.find(result.searchable_id) }

    render 'api/cards/index'
  end
end