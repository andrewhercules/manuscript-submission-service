class ManuscriptMailer < ActionMailer::Base

  default from: "sender@email.com"

  def new_manuscript_email(manuscript)
    @manuscript = manuscript
    mail(to: "recipient@email.com", subject: "New manuscript for approval")
  end

end
