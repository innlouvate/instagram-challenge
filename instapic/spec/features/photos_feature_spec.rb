require 'rails_helper'
require_relative 'web_helper'

feature 'photos' do

  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'photos have been added' do

    before do
      sign_up_and_add_photo
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('My photo')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'adding photos' do
    scenario 'prompts user to fill out a form, then displays the new photo' do
      sign_up
      click_link 'Add a photo'
      fill_in 'Name', with: 'Test photo'
      click_button 'Create Photo'
      expect(page).to have_content 'Test photo'
      expect(current_path).to eq '/photos'
    end

    scenario 'user must be logged in to create a photo' do
      visit '/photos'
      click_link 'Add a photo'
      expect(current_path).to eq '/users/sign_in'
    end

  end

  # context 'viewing photos' do
  #   let!(:photo) {Photo.create(name: "KFC")}
  #
  #   scenario 'lets a user view a photo' do
  #     visit '/photos'
  #     click_link 'KFC'
  #     expect(page).to have_content 'KFC'
  #     expect(current_path).to eq "/photos/#{kfc.id}"
  #   end
  # end

  context 'editing photos' do

    before { sign_up_and_add_photo }

    scenario 'let a user edit a photo' do
      sign_in
      click_link 'Edit My photo'
      fill_in 'Name', with: 'Edited title'
      click_button 'Update Photo'
      expect(page).to have_content 'Edited title'
      expect(current_path).to eq '/photos'
    end
  end

  context 'deleting photos' do
    before { sign_up_and_add_photo}

    scenario 'let a user delete a photo' do
      sign_in
      click_link 'Delete My photo'
      expect(page).not_to have_content('My photo')
      expect(page).to have_content('Photo deleted successfully')
    end

    scenario 'only the user that creates a photo can delete it' do
      sign_up(email: 'test2@test.com')
      click_link 'Delete My photo'
      expect(page).to have_content('My photo')
      expect(page).to have_content('error')
    end
  end
end
