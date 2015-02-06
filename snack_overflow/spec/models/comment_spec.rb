require 'rails_helper'
require 'factory_girl_rails'

describe Comment do
  let(:comment) {FactoryGirl.create(:comment)}

  it "has a valid FACTORY" do
    expect(FactoryGirl.create(:comment)).to be_valid
  end

  it "has a body" do
    expect(comment.body).to eq("I freaking love this snack")
  end

  it "can belong to a nom" do
    ex_nom = FactoryGirl.create(:nom)
    ex_com = FactoryGirl.create(:comment)
    ex_nom.comments << ex_com
    expect(ex_com.nom_id).to eq(ex_nom.id)
  end

  it "is created by a user" do
    expect(comment.user_id).to eq(1)
  end

  it "can recieve upvotes" do
    comment.upvote
    expect(comment.upvotes.last.votable_id).to eq(comment.id)
  end

  it "can recieve downvotes" do
    comment.downvote
    expect(comment.downvotes.last.votable_id).to eq(comment.id)
  end

  it "can recieve comments" do
    comment.replies <<  FactoryGirl.build(:comment)
    expect(comment.replies.count).to eq(1)
  end

end
