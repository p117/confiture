class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name
    	t.float :u_price
    end
  end
end
