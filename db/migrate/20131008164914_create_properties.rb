class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :uuid
      t.integer :user_id

      t.timestamps
    end
    add_index :properties, :uuid, :unique => true
  end
end
