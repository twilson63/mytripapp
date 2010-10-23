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
  
  describe "GET show" do
    before do
      Trip.should_receive(:find).and_return(@trip)
      get :show, :id => 1
    end

    it { response.should be_success }
    it { assigns(:trip).should eq(@trip) } 
    it { should render_template(:show) }
    it { flash[:notice].should be_nil }
    
    
  end

  describe "GET new" do
    before do
      Trip.should_receive(:new).and_return(@trip)
      get :new
    end

    it { response.should be_success }
    it { assigns(:trip).should eq(@trip) } 
    it { should render_template(:new) }
    it { flash[:notice].should be_nil }
    
    
  end

  describe "POST create" do
    before do
      Trip.should_receive(:new).and_return(@trip)
      @trip.should_receive(:save).and_return(true)
      post :create, :id => 1, :trip => {}
    end
    it { assigns(:trip).should eq(@trip) } 
    it { should redirect_to(trip_path(@trip)) }
    it { flash[:notice].should_not be_nil }    
  end
  
  

  describe "GET edit" do
    before do
      Trip.should_receive(:find).and_return(@trip)
      get :edit, :id => 1
    end

    it { response.should be_success }
    it { assigns(:trip).should eq(@trip) } 
    it { should render_template(:edit) }
    it { flash[:notice].should be_nil }
  end

  describe "PUT update" do
    before do
      Trip.should_receive(:find).and_return(@trip)
      @trip.should_receive(:update_attributes).and_return(true)
      put :update, :id => 1, :trip => {}
    end
    it { assigns(:trip).should eq(@trip) } 
    it { should redirect_to(trip_path(@trip)) }
    it { flash[:notice].should_not be_nil }    
  end
  
  describe "DELETE destroy" do
    before do
      Trip.should_receive(:find).and_return(@trip)
      @trip.should_receive(:destroy).and_return(true)
      delete :destroy, :id => 1
    end
    it { assigns(:trip).should eq(@trip) } 
    it { should redirect_to(trips_path) }
    it { flash[:notice].should_not be_nil }    
    
  end
  

end
