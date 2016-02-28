class Manuscript < ActiveRecord::Base

  has_many :approvals
  
end
