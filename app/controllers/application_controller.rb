class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  #Added this method to allow for display in frames 
  def iframe_action
    response.headers.delete "X-Frame-Options"
    render_something
  end
  
end