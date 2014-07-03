class CreateProductHistoric < ActiveRecord::Migration
  def change
    create_table :product_historics do |t|
    	t.integer :product_id, :null => false
    	t.float :u_price, :null => false
    	t.float :profit, :null => false
    	t.timestamps
    end
  end
end
