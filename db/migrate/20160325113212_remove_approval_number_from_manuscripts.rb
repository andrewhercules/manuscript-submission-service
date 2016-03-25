class RemoveApprovalNumberFromManuscripts < ActiveRecord::Migration
  def change
    remove_column :manuscripts, :approval_number, :string
  end
end
