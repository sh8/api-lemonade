class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  private

  def authenticate_user!
    if current_user.nil?
      render :json => {"type" => "unauthorized", "message" => "You are not authorized."}, :status => 401
    end
  end

  def current_user
    @current_user ||= User.where('access_token = ?', access_token).last
  end

  def access_token
    request.headers["X-Access-Token"]
  end

end
