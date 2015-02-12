require 'rails_helper'

feature "STUFF" do # srsly unprofessional..it's a giveaway that testing to you is an afterthought.  I might press on this point during interviews or I might use it to stress test you.
  let(:user) {FactoryGirl.create(:user)}

  scenario "Creates a new user successfully" do
    visit signup_path

    fill_in "Username", :with => user.username
    fill_in "Password", :with => user.password
    fill_in "Password confirmation", :with => user.password
    fill_in "Email", :with => user.email
    click_on "Sign Up"

    expect(page).to have_content(user.username)
  end

end
