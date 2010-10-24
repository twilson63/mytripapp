require 'spec_helper'

describe Trip::DetailsController do
  before do
    @trip = mock_model('Trip')
    @trip_detail = mock_model('TripDetail')
    Trip.should_receive(:find).and_return(@trip)
  end

  describe "GET new" do
    before do
      controller.should_receive(:build_trip_detail).and_return(@trip_detail)
      get :new, :trip_id => 1
    end
    it { assigns(:trip).should eq(@trip) } 
    it { assigns(:trip_detail).should eq(@trip_detail) } 
    it { response.should be_success }
    it { should render_template(:new) }
    it { flash[:notice].should be_nil }    
  end

  describe "POST create" do
    before do
      controller.should_receive(:build_trip_detail).and_return(@trip_detail)
      @trip_detail.should_receive(:save).and_return(true)
      post :create, :id => 1, :trip_id => 1, :trip_detail => {}
    end
    it { assigns(:trip).should eq(@trip) } 
    it { assigns(:trip_detail).should eq(@trip_detail) } 
    it { should redirect_to(trip_path(@trip)) }
    it { flash[:notice].should_not be_nil }    
  end

  describe "GET edit" do
    before do
      controller.should_receive(:find_trip_detail).and_return(@trip_detail)
      get :edit, :id => 1, :trip_id => 1
    end
  
    it { response.should be_success }
    it { assigns(:trip).should eq(@trip) }
    it { assigns(:trip_detail).should eq(@trip_detail) }      
    it { should render_template(:edit) }
    it { flash[:notice].should be_nil }
  end

  describe "PUT update" do
    before do
      controller.should_receive(:find_trip_detail).and_return(@trip_detail)
      @trip_detail.should_receive(:update_attributes).and_return(true)
      put :update, :id => 1, :trip_id => 1, :trip_detail => {}
    end
    it { assigns(:trip).should eq(@trip) } 
    it { assigns(:trip_detail).should eq(@trip_detail) }      
    it { should redirect_to(trip_path(@trip)) }
    it { flash[:notice].should_not be_nil }    
  end

end
