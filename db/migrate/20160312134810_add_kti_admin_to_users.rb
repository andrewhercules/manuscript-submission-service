class AddKtiAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :kti_admin, :boolean, default: false
  end
end
