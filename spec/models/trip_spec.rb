require 'spec_helper'

describe Trip do
  subject { Factory(:trip) }
  it{ should be_valid }
  it{ should have_attribute(:name)}
  it{ should have_attribute(:user_id)}
  it{ should have_attribute(:start)}
  it{ should have_attribute(:end)}
  it{ should have_attribute(:description)}
  
  it{ should belong_to(:user)}
  
  it{ should validate_presence_of(:user_id)}
end
