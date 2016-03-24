require 'rails_helper'
require_relative 'helpers/common_feature_spec_methods_helper'

include CommonFeatureSpecMethodsHelper

feature 'approvals' do

  let! (:test_manuscript) {Manuscript.create(title: 'Academic manuscript title for a journal article', author: 'Author Name', journal: 'Journal of Academic Studies', document_file_name: 'Sample_Manuscript.pdf', document_content_type: 'application/pdf', vpr_approval: false, kti_approval: false)}

  scenario 'does not allow regular user to see link to approve a manuscript' do
    sign_up_user('test@email.com')
    sign_in_user('test@email.com')
    visit '/manuscripts'
    submit_manuscript('Assessing the 2015 British General Election', 'Lead Author')
    click_link 'Assessing the 2015 British General Election'
    expect(page).not_to have_content('Approve Manuscript')
  end

  scenario 'does not allow regular user to access approval form' do
    sign_up_user('test@email.com')
    sign_in_user('test@email.com')
    visit "/manuscripts/#{test_manuscript.id}/approvals/new"
    expect(page).to have_content('Error! You do not have the correct administrative rights to issue an approval!')
  end

  scenario 'allows the VP Research Admin to see manuscripts that need approval' do
    create_test_manuscript
    sign_up_vpr_user('vpradmin@email.com')
    sign_in_user('vpradmin@email.com')
    visit '/manuscripts'
    expect(page).to have_content('Manuscripts Awaiting VP Research Approval')
    expect(page).to have_content('Sample title for academic article')
  end

  scenario 'only allows the VP Research to see the manuscripts that need approval from that user' do
    create_test_manuscript
    sign_up_vpr_user('vpradmin@email.com')
    sign_in_user('vpradmin@email.com')
    visit '/manuscripts'
    expect(page).to have_content 'Manuscripts Awaiting VP Research Approval'
    expect(page).not_to have_content 'Manuscripts Awaiting KTI Approval'
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

  scenario 'allows the KTI Admin to see manuscripts that need approval' do
    create_test_manuscript
    sign_up_kti_user('ktiadmin@email.com')
    sign_in_user('ktiadmin@email.com')
    visit '/manuscripts'
    expect(page).to have_content('Manuscripts Awaiting KTI Approval')
    expect(page).to have_content('Sample title for academic article')
  end

  scenario 'only allows the KTI Admin to see the manuscripts that need approval from that user' do
    create_test_manuscript
    sign_up_kti_user('ktiadmin@email.com')
    sign_in_user('ktiadmin@email.com')
    visit '/manuscripts'
    expect(page).to have_content 'Manuscripts Awaiting KTI Approval'
    expect(page).not_to have_content 'Manuscripts Awaiting VP Research Approval'
  end

  scenario 'allows the KTI Admin to approve a manuscript' do
    create_test_manuscript
    sign_up_kti_user('ktiadmin@email.com')
    sign_in_user('ktiadmin@email.com')
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
