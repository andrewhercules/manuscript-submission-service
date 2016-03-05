require 'rails_helper'

feature 'Signing in and signing out' do

  context 'user visits the homepage and is not signed in' do

    scenario 'user should see a sign in link and a sign up link' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    scenario 'user should not see a sign out link' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end

  end

  context 'user visits the homepage and signs in' do

    before do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: 'abcd1234'
      fill_in 'Password Confirmation', with: 'abcd1234'
      click_button 'Sign up'
    end

    scenario 'user should see a sign out link' do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    scenario 'user should not see a sign in link or a sign up link' do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end

  end

end
