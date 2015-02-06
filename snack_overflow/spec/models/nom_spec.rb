require 'rails_helper'
require 'factory_girl_rails'

describe Nom do
  let(:nom) {FactoryGirl.create(:nom)}

  it "has a valid FACTORY" do
    expect(FactoryGirl.create(:nom)).to be_valid
  end

  it "has a title that is Big" do
    expect(nom.title).to eq('Biggie Smalls')
  end

  it "has a picture url field" do
    expect(nom.pic_url).to eq("wowwhataterriblesite.com")
  end

  it "has a score" do
    expect(nom.score).to be_valid
  end

  it "can recieve upvotes" do
    expect(nom.upvote).to change(nom.score).by(1)
  end

  it "can recieve downvotes" do
    expect(nom.downvote).to change(nom.score).by(-1)
  end

  it "can recieve comments" do
    nom.comments <<  FactoryGirl.build(:comment)
    expect(nom.comments.count).to eq(1)
  end

  # User can make comment
  # Nested comments

end
