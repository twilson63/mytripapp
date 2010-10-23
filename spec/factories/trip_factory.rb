Factory.define :trip do |trip|
  trip.name Faker::Lorem.words(2)
  trip.user { Factory(:user) }
end
