class CreateProductHistoric < ActiveRecord::Migration
  def change
    create_table :product_historics do |t|
    	t.string :name
    	t.float :u_price
    	t.float :profit
    	t.timestamp
    end
  end
end
