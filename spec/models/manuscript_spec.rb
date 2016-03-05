require 'rails_helper'

RSpec.describe Manuscript, :type => :model do

  it { is_expected.to have_many :approvals }

  it { should belong_to(:user) }

  it {should have_attached_file(:document) }

  it { should validate_attachment_presence(:document) }

  it { should validate_attachment_content_type(:document).
    allowing('application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document').
    rejecting('text/plain', 'text/xml') }

  it { should validate_attachment_size(:document).
                less_than(10.megabytes) }

end
