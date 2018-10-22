class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  #Added this method to allow for display in frames
  after_action :allow_intelatek_frames
  
 
  private
  
  def allow_intelatek_frames
    response.headers['X-Frame-Options'] = 'ALLOWALL'
  end
  
end