class CreateIngredient < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
    	t.string :name
    	t.float :u_price
    	t.timestamps
    end
  end
end
