require 'rails_helper'

feature 'manuscripts' do

  context 'no manuscripts have been added' do

    scenario 'should display a prompt to add a manuscript' do
      visit '/manuscripts'
      expect(page).to have_content 'No manuscripts added yet'
      expect(page).to have_link 'Add a manuscript'
    end

  end

  context 'manuscripts have been added' do

    before do
      Manuscript.create(title: 'Academic manuscript title for a journal article', author: 'Author Name', journal: 'Journal of Academic Studies')
    end

    scenario 'manuscripts have been added' do
      visit '/manuscripts'
      expect(page).to have_content('Academic manuscript title for a journal article')
      expect(page).not_to have_content('No manuscripts added yet')
    end

  end

  context 'creating a manuscript' do

    scenario 'user is prompted to fill out a form, then browser displays the new manuscript' do
      visit '/manuscripts'
      click_link 'Add a manuscript'
      fill_in 'Title', with: 'My new manuscript for submission'
      fill_in 'Author', with: 'Lead Author Name'
      fill_in 'Journal', with: 'Journal of Academic Studies'
      click_button 'Submit Manuscript'
      expect(page).to have_content 'My new manuscript for submission'
      expect(current_path).to eq '/manuscripts'
    end

  end

  context 'viewing a manuscript' do

    let! (:my_manuscript) {Manuscript.create(title: 'Academic manuscript title for a journal article', author: 'Author Name', journal: 'Journal of Academic Studies')}

    scenario 'user would like to view a manuscript' do
      visit '/manuscripts'
      click_link 'Academic manuscript title for a journal article'
      expect(page).to have_content 'Academic manuscript title for a journal article'
      expect(current_path).to eq "/manuscripts/#{my_manuscript.id}"
    end

  end

  context 'editing a manuscript' do

    let! (:my_manuscript) {Manuscript.create(title: 'Academic manuscript title for a journal article', author: 'Author Name', journal: 'Journal of Academic Studies')}

    scenario do
      visit '/manuscripts'
      click_link 'Academic manuscript title for a journal article'
      click_link 'Edit Manuscript Details'
      fill_in 'Author', with: 'New Article Author'
      click_button 'Update Manuscript'
      expect(page).to have_content 'New Article Author'
      expect(current_path).to eq '/manuscripts'
    end
    
  end

end
