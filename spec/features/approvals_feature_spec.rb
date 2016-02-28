require 'rails_helper'

feature 'approvals' do

  before do
    Manuscript.create(title: 'Academic manuscript title for a journal article', author: 'Author Name', journal: 'Journal of Academic Studies')
  end

  scenario 'allows user to approve a manuscript' do
    visit '/manuscripts'
    click_link 'Academic manuscript title for a journal article'
    click_link 'Approve Manuscript'
    choose 'approval_approved_true'
    fill_in 'Comments', with: 'Approved for publication'
    click_button 'Submit Approval'
    expect(current_path).to eq '/manuscripts'
    expect(page).to have_content('Approved for publication')
    expect(page).to have_content('Approved: true')
  end

end
