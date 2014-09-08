class Api::UrlExtractorController < ApplicationController
  before_filter :check_if_signed_in
  
  def parse
    page = MetaInspector.new(params[:url])

    render json: {title: page.title, description: page.description, image: page.image}
  end
end