class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name
    	t.float :u_price
    	t.float :profit
    	t.integer :jar_id
    	t.timestamps
    end
    add_index :products, :jar_id,                :unique => true
  end
end
