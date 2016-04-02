class Manuscript < ActiveRecord::Base

  belongs_to :user

  has_many :approvals

  has_attached_file :document

  validates_attachment :document, presence: true,
    :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) },
    :size => { less_than: 10.megabytes },
    :default_url => "/documents/missing_document.pdf"

    def send_manuscript_for_approval(list_of_email_addresses)
      list_of_email_addresses.each { |email_address| ManuscriptMailer.new_manuscript_email(self, email_address).deliver_now   }
    end

end
