class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :work
      t.boolean :check
      t.timestamps
    end
  end
end
