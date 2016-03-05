require 'rails_helper'

RSpec.describe Approval, :type => :model do

  it { should belong_to(:manuscript).dependent(:destroy) }

  it { should belong_to(:user) }

end
