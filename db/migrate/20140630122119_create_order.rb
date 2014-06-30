class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :global_price, :null => false
      t.integer :user_id, :null => false

      #date
      t.timestamps
    end
    add_index :orders, :user_id,                :unique => true
  end
end
