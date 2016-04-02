class ManuscriptMailer < ActionMailer::Base

  default from: "sender@email.com"

  def new_manuscript_email(manuscript, email_address)
    @manuscript = manuscript
    mail(to: email_address, subject: "New manuscript for approval")
  end

end
