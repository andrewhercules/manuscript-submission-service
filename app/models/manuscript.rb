class Manuscript < ActiveRecord::Base

  belongs_to :user

  has_many :approvals

end
