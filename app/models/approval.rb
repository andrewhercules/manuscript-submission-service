class Approval < ActiveRecord::Base

  belongs_to :user
  
  belongs_to :manuscript, dependent: :destroy

end
