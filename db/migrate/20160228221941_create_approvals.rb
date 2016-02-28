class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.boolean :approved
      t.text :comments

      t.timestamps null: false
    end
  end
end
