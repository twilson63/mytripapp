class Trip::DetailsController < ApplicationController
  respond_to :html
  before_filter :find_trip
  
  def new
    @trip_detail = build_trip_detail
    respond_with [@trip, @trip_detail]
  end
  
  def create
    @trip_detail = build_trip_detail
    flash[:notice] = t('trip_details.create') if @trip_detail.save
    respond_with [@trip, @trip_detail], :location => trip_path(@trip)
  end
  
  def edit
    @trip_detail = find_trip_detail
    respond_with [@trip, @trip_detail]
  end
  
  def update
    @trip_detail = find_trip_detail
    flash[:notice] = t('trip_details.update') if @trip_detail.update_attributes(params[:trip_detail])

    respond_with [@trip, @trip_detail], :location => trip_path(@trip)    
  end
  
  protected
  
  def find_trip
    @trip = Trip.find(params[:trip_id])
  end
  
  def find_trip_detail
    @trip.trip_details.find(params[:id]) 
  end
  
  def build_trip_detail
    @trip.trip_details.build(params[:trip_detail] || {})    
  end
  
  
end
