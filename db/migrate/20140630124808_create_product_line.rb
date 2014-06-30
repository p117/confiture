class CreateProductLine < ActiveRecord::Migration
  def change
    create_table :product_lines do |t|
	    t.integer :amount,              :null => false
	  	t.integer :product_id,					:null => false
	  	t.integer :ingredient_id,					:null => false
	  	t.timestamp
    end
    add_index :product_lines, [:product_id,:ingredient_id],                :unique => true
  end
end
