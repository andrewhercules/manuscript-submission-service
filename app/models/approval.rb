class Approval < ActiveRecord::Base

  belongs_to :manuscript, dependent: :destroy

end
