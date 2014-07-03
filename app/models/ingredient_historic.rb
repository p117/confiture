class IngredientHistorics < ActiveRecord::Base

	validates :ingredient_id, presence: true
	validates :u_price, presence: true

end
