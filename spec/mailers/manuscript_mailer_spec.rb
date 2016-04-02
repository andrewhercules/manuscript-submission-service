require 'rails_helper'
require 'spec_helper'

RSpec.describe ManuscriptMailer, :type => :mailer do

  describe 'new_manuscript_email' do

    let(:manuscript) { double :manuscript, title: 'Academic manuscript title for a journal article', author: 'Author Name', journal: 'Journal of Academic Studies' }
    let(:mail) { ManuscriptMailer.new_manuscript_email(manuscript) }

    it 'should render a subject' do
      expect(mail.subject).to eq('New manuscript for approval')
    end

    it 'should render the email address of the sender' do
      expect(mail.from).to eq(['sender@email.com'])
    end

    it 'should render the email address of the recipient' do
      expect(mail.to).to eq(['recipient@email.com'])
    end
  end

end
