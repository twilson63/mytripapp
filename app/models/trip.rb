class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :trip_details
  
  validates :user_id, :presence => true
end
