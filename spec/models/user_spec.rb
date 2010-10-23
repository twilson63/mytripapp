require 'spec_helper'

describe User do
  it { should be_valid}
  it { should have_attribute(:name)}
  it { should have_attribute(:nickname)}
  it { should have_attribute(:provider)}
  it { should have_attribute(:email)}
  it { should have_attribute(:image_url)}
  
  it { should have_many(:trips)}
end
