class CreateManuscripts < ActiveRecord::Migration
  def change
    create_table :manuscripts do |t|
      t.string :title
      t.text :author
      t.string :journal

      t.timestamps null: false
    end
  end
end
