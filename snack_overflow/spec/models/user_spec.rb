require 'rails_helper'
require 'factory_girl_rails'

describe User do

  let(:user) { FactoryGirl.create(:user) }
  let(:nom) { FactoryGirl.create(:nom)}

  it "has a valid FACTORY" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "to be valid User" do
    expect(user).to be_valid
  end

  it "should have a username" do
    expect(user.username).to eq("Biggie_Smalls")
  end

  it "should have a password" do
    expect(user.password).to eq("bigpoppa")
  end

  it "should have a email" do
    expect(user.email).to eq('tupac4lyf3@hotmail.com')
  end

  it "should be able to comment" do
    expect(user.comments).to be_truthy
  end

  it "should be able to post noms" do
    expect(user.noms).to be_truthy
  end

  xit "should be able to see favorited noms" do
    expect(user.upvoted.count).to eq(3)
  end

  xit "should be able to calculate own's brownie points" do
    expect(user.brownie_points).to eq(40)
  end

end
