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

  it "is created by a user" do
    expect(nom.user_id).to eq(1)
  end

  it "can recieve upvotes" do
    nom.upvote
    expect(nom.upvotes.last.votable_id).to eq(nom.id)
  end

  it "can recieve downvotes" do
    nom.downvote
    expect(nom.downvotes.last.votable_id).to eq(nom.id)
  end

  it "has a score" do
    expect(nom.score).to be_kind_of(Integer)
  end

  it "can change score when upvoted" do
    nom.upvote
    expect(nom.score).to eq(1)
  end

  it "can change score when downvoted" do
    nom.downvote
    expect(nom.score).to eq(-1)
  end

  it "can recieve comments" do
    nom.comments <<  FactoryGirl.build(:comment)
    expect(nom.comments.count).to eq(1)
  end

end
