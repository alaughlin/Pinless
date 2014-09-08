class StaticController < ApplicationController
  def root
  end

  private

  def check_if_signed_in
    redirect_to new_session_url unless signed_in?
  end
end
