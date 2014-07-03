class IngredientHistoric < ActiveRecord::Base

	validates :ingredient_id, presence: true
	validates :u_price, presence: true
	validates :name, presence:true
end
