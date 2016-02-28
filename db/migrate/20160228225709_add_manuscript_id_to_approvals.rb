class AddManuscriptIdToApprovals < ActiveRecord::Migration
  def change
    add_reference :approvals, :manuscript, index: true
  end
end
