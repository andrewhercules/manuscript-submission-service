module CommonFeatureSpecMethodsHelper

  def sign_up_user(email)
    User.create(email: email, password: '12345678', password_confirmation: '12345678')
  end

  def sign_in_user(email)
    visit '/'
    click_link 'Sign in'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: '12345678'
    click_button 'Log in'
  end

  def submit_manuscript(title, author)
    click_link 'Add a manuscript'
    fill_in 'Title', with: title
    fill_in 'Author', with: author
    fill_in 'Journal', with: 'Journal of Academic Studies'
    attach_file 'manuscript[document]', "#{Rails.root}/spec/fixtures/sample_document.pdf"
    click_button 'Submit Manuscript'
  end

end
