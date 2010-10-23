class AuthenticationsController < ApplicationController
  
  def create
    user_info = request.env["rack.auth"]["user_info"]
    @user = User.new(
      :name => user_info['name'],
      :email => user_info['email'],
      :nickname => user_info['nickname'],
      :image_url => user_info['image'],
      :provder => params[:provider]
    )
    session[:current_user] = @user.id if @user.save
    redirect_to trips_path
  end
  
end
