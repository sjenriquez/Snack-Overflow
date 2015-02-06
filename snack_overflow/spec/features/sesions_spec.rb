require 'rails_helper'

feature 'login or signup' do
  let(:user) { create(:user) }
  scenario "should have a login option on the root page" do
    visit root_path
    expect(page).to have_css('div#login')
  end

  scenario "should have a login option on the root page" do
    visit root_path
    expect(page).to have_css('div#signup')
  end

  scenario "should log user in with signup" do
    visit root_path
    click_link 'Signup'
    fill_in 'user_name', with: user.name
    fill_in 'user_password', with: user.password
    click_button 'Signup'
    # byebug
    expect(page).to have_content user.name
  end

  scenario "should log user in with Login and display username" do
    visit root_path
    click_link 'Login'
    fill_in 'user_name', with: user.name
    fill_in 'user_password', with: user.password
    click_button 'Login'
    # byebug
    expect(page).to have_content user.name
  end
end
