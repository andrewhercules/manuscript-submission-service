require 'rails_helper'

RSpec.describe Manuscript.new, :type => :model do

  it { is_expected.to have_many :approvals }

  it { should belong_to(:user) }

  it {should have_attached_file(:document) }

  it { should validate_attachment_presence(:document) }

  it { should validate_attachment_content_type(:document).
    allowing('application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document').
    rejecting('text/plain', 'text/xml') }

  it { should validate_attachment_size(:document).less_than(10.megabytes) }

  it {should respond_to(:approval_number) }

  it { should have_attributes(:approval_number => "N/A") }

  it 'sends an email' do
    expect { Manuscript.new.send_manuscript_for_approval(['test1@email.com']) }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

end
