class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :global_price, :null => false
      t.integer :customer_id, :null => false

      #date
      t.timestamps
    end
    add_index :orders, :customer_id,                :unique => true
  end
end
