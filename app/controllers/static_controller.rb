class StaticController < ApplicationController
  before_filter :check_if_signed_in
  def root
  end
end