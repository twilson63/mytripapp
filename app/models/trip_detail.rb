class TripDetail < ActiveRecord::Base
  DETAIL_TYPES = ['Number','Link','Post','Photo']
  belongs_to :trip
end
