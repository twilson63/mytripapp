class User < ActiveRecord::Base
  has_many :trips
  
  attr_accessible :name, :email, :nickname, :image_url
  
end
