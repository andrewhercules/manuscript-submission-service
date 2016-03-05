class AddUserIdToApprovals < ActiveRecord::Migration
  def change
    add_reference :approvals, :user, index: true
  end
end
