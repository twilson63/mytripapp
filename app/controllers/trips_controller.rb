class TripsController < ApplicationController
  respond_to :html
  before_filter :authenticate!
  
  def index
    @user = User.find(current_user)
    @trips = Trip.where(:user_id => current_user) 
  end
  
  def new
    @trip = Trip.new
  end
  
  def create
    @trip = Trip.new(params[:trip].merge(:user_id => current_user))
    flash[:notice] = t('trips.create') if @trip.save
    respond_with @trip
  end
  
  def show
    @trip = Trip.find(params[:id])
  end
  
  def edit
    @trip = Trip.find(params[:id])
    respond_with @trip
  end
  
  def update
    @trip = Trip.find(params[:id])
    flash[:notice] = t('trips.update') if @trip.update_attributes(params[:trip])
    respond_with @trip
  end
  
  def destroy
    @trip = Trip.find(params[:id])
    flash[:notice] = t('trips.delete') if @trip.destroy
    respond_with @trip, :location => trips_path    
  end
  
  
  
  
end
