class AddKtiApprovalToManuscripts < ActiveRecord::Migration
  def change
    add_column :manuscripts, :kti_approval, :boolean, default: false
  end
end
