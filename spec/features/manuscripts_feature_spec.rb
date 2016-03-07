require 'rails_helper'

feature 'manuscripts' do

  before do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'abcd1234'
    fill_in 'Password Confirmation', with: 'abcd1234'
    click_button 'Sign up'
  end

  context 'no manuscripts have been added' do

    scenario 'user is prompted to add a manuscript' do
      visit '/manuscripts'
      expect(page).to have_content 'No manuscripts added yet'
      expect(page).to have_link 'Add a manuscript'
    end

  end

  context 'creating a manuscript' do

    scenario 'user is prompted to fill out a form, then browser displays the new manuscript' do
      visit '/manuscripts'
      click_link 'Add a manuscript'
      fill_in 'Title', with: 'My new manuscript for submission'
      fill_in 'Author', with: 'Lead Author Name'
      fill_in 'Journal', with: 'Journal of Academic Studies'
      attach_file 'manuscript[document]', "#{Rails.root}/spec/fixtures/sample_document.pdf"
      click_button 'Submit Manuscript'
      expect(page).to have_content 'My new manuscript for submission'
      expect(current_path).to eq '/manuscripts'
    end

  end

  context 'viewing a manuscript' do

    let! (:my_manuscript) {Manuscript.create(title: 'Academic manuscript title for a journal article', author: 'Author Name', journal: 'Journal of Academic Studies')}

    scenario 'user encounters an error if they attempt to view a manuscript they do not own' do
      visit "/manuscripts/#{my_manuscript.id}/edit"
      expect(page).to have_content 'Unfortunately, you cannot access this manuscript'
    end

    scenario 'user can view manuscripts that they have uploaded' do
      visit '/manuscripts'
      click_link 'Add a manuscript'
      fill_in 'Title', with: 'My new manuscript for submission'
      fill_in 'Author', with: 'Lead Author Name'
      fill_in 'Journal', with: 'Journal of Academic Studies'
      attach_file 'manuscript[document]', "#{Rails.root}/spec/fixtures/sample_document.pdf"
      click_button 'Submit Manuscript'
      expect(page).to have_content 'My new manuscript for submission'
      expect(page).not_to have_content 'Academic manuscript title for a journal article '
    end

  end

  context 'editing a manuscript' do

    scenario 'user can edit information for a manuscript they have uploaded' do
      visit '/manuscripts'
      click_link 'Add a manuscript'
      fill_in 'Title', with: 'My new manuscript for submission'
      fill_in 'Author', with: 'Lead Author Name'
      fill_in 'Journal', with: 'Journal of Academic Studies'
      attach_file 'manuscript[document]', "#{Rails.root}/spec/fixtures/sample_document.pdf"
      click_button 'Submit Manuscript'
      click_link 'My new manuscript for submission'
      click_link 'Edit Manuscript Details'
      fill_in 'Author', with: 'New Article Author'
      click_button 'Update Manuscript'
      expect(page).to have_content 'New Article Author'
      expect(page).not_to have_content 'Lead Author Name'
      expect(current_path).to eq '/manuscripts'
    end

  end

  context 'deleting a manuscript' do

    scenario 'user can delete a manuscript that they own' do
      visit '/manuscripts'
      click_link 'Add a manuscript'
      fill_in 'Title', with: 'My new manuscript for submission'
      fill_in 'Author', with: 'Lead Author Name'
      fill_in 'Journal', with: 'Journal of Academic Studies'
      attach_file 'manuscript[document]', "#{Rails.root}/spec/fixtures/sample_document.pdf"
      click_button 'Submit Manuscript'
      click_link 'My new manuscript for submission'
      click_link 'Delete Manuscript'
      expect(page).not_to have_content 'My new manuscript for submission'
      expect(page).to have_content 'Manuscript successfully deleted'
    end

  end

end
