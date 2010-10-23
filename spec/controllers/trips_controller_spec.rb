require 'spec_helper'

describe TripsController do
  before :each do
    controller.should_receive(:authenticate!).with(no_args).once.and_return(true) 
    @trip = mock_model('Trip')
  end

  describe "GET index" do
    before do

      Trip.should_receive(:where).and_return([@trip])
      get :index
    end

    it { response.should be_success }
    it { assigns(:trips).should eq([@trip]) } 
    it { should render_template(:index) }
    it { flash[:notice].should be_nil }
  end

end
