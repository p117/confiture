class CreateOrderLine < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
  	t.integer :amount,              :null => false
  	t.integer :product_id,					:null => false
  	t.integer :order_id,					:null => false
  	t.timestamp
    end
		add_index :order_lines, [:product_id,:order_id],                :unique => true
  end
end
