require 'rails_helper'

RSpec.describe Approval, :type => :model do

  it { is_expected.to have_many :approvals }

end
