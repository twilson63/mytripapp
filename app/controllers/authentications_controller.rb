class AuthenticationsController < ApplicationController
  
  def create
    user_info = request.env["rack.auth"]["user_info"]
    @user = User.find_or_create_by_nickname(user_info['nickname'],    
      :name => user_info['name'],
      :email => user_info['email'],
      :image_url => user_info['image'],
      :provder => params[:provider]
    )
    session[:current_user] = @user.id if @user.save
    redirect_to trips_path
  end
  
end
