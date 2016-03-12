require 'rails_helper'
require_relative 'helpers/common_feature_spec_methods_helper'

include CommonFeatureSpecMethodsHelper

feature 'approvals' do

  scenario 'does not allow regular user to approve a manuscript' do
    sign_up_user('test@email.com')
    sign_in_user('test@email.com')
    visit '/manuscripts'
    submit_manuscript('Assessing the 2015 British General Election', 'Lead Author' )
    click_link 'Assessing the 2015 British General Election'
    expect(page).not_to have_content('Approve Manuscript')
  end

  scenario 'allows the VP Research Admin to see manuscripts that need approval' do
    create_test_manuscript
    sign_up_vpr_user('vpradmin@email.com')
    sign_in_user('vpradmin@email.com')
    visit '/manuscripts'
    expect(page).to have_content('Manuscripts Awaiting Approval')
    expect(page).to have_content('Sample title for academic article')
  end

  scenario 'allows the VP Research Admin to approve a manuscript' do
    create_test_manuscript
    sign_up_vpr_user('vpradmin@email.com')
    sign_in_user('vpradmin@email.com')
    visit '/manuscripts'
    click_link 'Sample title for academic article'
    expect(page).to have_content('Approve Manuscript')
    click_link 'Approve Manuscript'
    choose 'approval_approved_true'
    fill_in 'Comments', with: 'Approved for publication'
    click_button 'Submit Approval'
    expect(current_path).to eq '/manuscripts'
    expect(page).not_to have_content('Sample title for academic article')
  end

end
