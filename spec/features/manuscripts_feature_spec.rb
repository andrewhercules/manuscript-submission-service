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

end
