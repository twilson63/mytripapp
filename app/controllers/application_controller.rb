class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  
  def authenticate!
    if current_user
      @current_user = User.find(current_user)
    else
      redirect_to new_authentication_path
    end
    
  end
  
  def current_user
    session[:current_user]
  end
  
  
end
