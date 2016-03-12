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

end
