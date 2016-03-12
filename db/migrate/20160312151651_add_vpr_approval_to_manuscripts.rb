class AddVprApprovalToManuscripts < ActiveRecord::Migration
  def change
    add_column :manuscripts, :vpr_approval, :boolean, default: false
  end
end
