class CreateIngredientHistoric < ActiveRecord::Migration
  def change
    create_table :ingredient_historics do |t|
    	t.string :name
    	t.float :u_price
    	t.timestamp
    end
  end
end
