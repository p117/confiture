class CreateIngredientHistoric < ActiveRecord::Migration
  def change
    create_table :ingredient_historics do |t|
    	t.integer :ingredient_id, :null => false
    	t.float :u_price, :null => false
    	t.timestamps
    end
  end
end
