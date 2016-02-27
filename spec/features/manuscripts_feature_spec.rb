require 'rails_helper'

feature 'manuscripts' do

  context 'no manuscripts have been added' do

    scenario 'should display a prompt to add a manuscript' do
      visit '/manuscripts'
      expect(page).to have_content 'No manuscripts added yet'
      expect(page).to have_link 'Add a manuscript'
    end

  end

end
