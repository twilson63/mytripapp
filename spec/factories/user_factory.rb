Factory.define :user do |user|
  user.name Faker::Name.name
  user.email Faker::Internet.email
  user.nickname Faker::Internet.user_name
end
