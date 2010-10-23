require 'spec_helper'

describe TripDetail do
  it{ should be_valid }
  it{ should have_attribute(:name)}
  it{ should have_attribute(:value)}
  it{ should have_attribute(:trip_id)}
  it{ should belong_to(:trip)}
end
