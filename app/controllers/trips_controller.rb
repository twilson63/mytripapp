class TripsController < ApplicationController
  respond_to :html
  before_filter :authenticate!
  
  def index
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
  
end
