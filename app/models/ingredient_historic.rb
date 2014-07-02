class IngredientHistorics < ActiveRecord::Base

	validates :name, presence: true
	validates :u_price, presence: true

end
