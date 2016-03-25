class AddApprovalNumberToManuscripts < ActiveRecord::Migration
  def change
    add_column :manuscripts, :approval_number, :string, :default => "N/A"
  end
end
