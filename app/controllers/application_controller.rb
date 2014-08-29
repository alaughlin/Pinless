class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sign_in!(user)
    session[:session_token] = user.session_token
    puts session[:session_token]
    redirect_to "#/users/#{user.id}"
  end

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def signed_in?
    !!current_user
  end

  def ensure_signed_in
    redirect_to new_session_url unless signed_in?
  end
end
