class AddUserIdToManuscripts < ActiveRecord::Migration
  def change
    add_reference :manuscripts, :user, index: true
  end
end
