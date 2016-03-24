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

  def create_test_manuscript
    Manuscript.create(title: 'Sample title for academic article', author: 'Author Name', journal: 'Journal of Academic Studies', document_file_name: 'Sample_Manuscript.pdf', document_content_type: 'application/pdf', vpr_approval: false, kti_approval: false)
  end

  def sign_up_vpr_user(email)
    User.create(email: email, password: '12345678', password_confirmation: '12345678', vpr_admin: true)
  end

  def sign_up_kti_user(email)
    User.create(email: email, password: '12345678', password_confirmation: '12345678', kti_admin: true)
  end

end
