class Manuscript < ActiveRecord::Base

  belongs_to :user

  has_many :approvals

  has_attached_file :document

  validates_attachment :document, presence: true,
    :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) },
    :size => { less_than: 10.megabytes },
    :default_url => "/documents/missing_document.pdf"

end
