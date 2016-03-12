class AddVprAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :vpr_admin, :boolean, default: false
  end
end
