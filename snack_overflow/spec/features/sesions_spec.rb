require 'rails_helper'

feature 'login or signup' do
  let(:user) { create(:user) }
  scenario "should have a login option on the root page" do
    visit root_path
    expect(page).to have_link('Login')
  end

  scenario "should have a Register option on the root page" do
    visit root_path
    expect(page).to have_link('Register')
  end

  scenario "should log user in with signup" do
    visit
    visit root_path
    click_link 'Register'
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Signup'
    # byebugquit
    expect(page).to have_content user.username
  end

  scenario "should log user in with Login and display username" do
    visit root_path
    click_link 'Login'
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button 'Login'
    # byebug
    expect(page).to have_content user.username
  end
end
