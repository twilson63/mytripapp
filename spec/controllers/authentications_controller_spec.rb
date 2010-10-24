require 'spec_helper'

describe AuthenticationsController do

  describe "POST create" do
    before do
      controller.should_receive(:user_info).exactly(4).times.and_return(:nickname => 'jon', :name => Faker::Name.name)
      @user = mock_model('User')
      User.should_receive(:find_or_create_by_nickname).and_return(@user)
      @user.should_receive(:save).and_return(true)
      post :create, :provider => 'twitter'
    end
    it { should redirect_to(trips_path) }
    it { flash[:notice].should be_nil }    
  end

end
