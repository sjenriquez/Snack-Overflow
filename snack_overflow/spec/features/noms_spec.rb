require 'rails_helper'

feature "test root page" do
  scenario "confirm homepage routes to categories" do
    visit root_path
    expect(page).to have_css('div#noms-all')

  end

  scenario "links to noms" do
    visit root_path
    click_link Nom.first.title
    expect(current_path).to eq(nom_path(1))
  end

  scenario "does not link to incorrect Nom" do
    visit root_path
    click_link Nom.first.title
    expect(current_path).to_not eq(Nom_path(3))
  end

end

feature "test Noms page" do
  scenario "displays all noms" do
    visit articles_path
    expect(page).to have_selector(".nom-title", Nom, :count)
  end

  scenario "Nom titles link to Nom show pages" do
    visit articles_path
    click_link Nom.find(5).title
    expect(current_path).to eq(nom_path(5))
  end

end

feature 'create a new comment on Nom' do
  scenario "creates a new comment on a Nom " do
    visit nom_path(5)
    expect {
    fill_in 'comment_body', with: 'Ballz'
    click_button 'Add Comment'
    }.to change(Comment, :count).by(1)
  end

  scenario "creates a new comment on a Comment " do
    visit comment_path(1)

    fill_in 'comment_body', with: 'Ballz and stuff'
    click_button 'Add Comment'
    expect {Comment.last.parent_id}
    .to eq(1)
  end

end



feature 'destroy a Nom' do
  scenario 'IT Deletes a Nom' do
    visit nom_path(1)
    expect {click_link 'Delete'}.to change(Nom, :count).by(-1)
  end

end


