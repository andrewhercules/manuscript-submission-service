require 'rails_helper'

RSpec.describe Manuscript, :type => :model do

  it { is_expected.to have_many :approvals }

  it { should belong_to(:user) }

end
