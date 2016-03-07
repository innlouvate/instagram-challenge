require 'rails_helper'
require_relative 'web_helper'

feature 'commenting' do
  before { sign_up_and_add_photo }

  scenario 'allows users to leave a comment using a form' do
    visit '/photos'
    click_link 'Comment'
    fill_in 'Description', with: "photo comment"
    click_button 'Comment'
    expect(current_path).to eq '/photos'
    expect(page).to have_content('photo comment')
  end
end
