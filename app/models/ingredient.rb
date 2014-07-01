class Ingredient < ActiveRecord::Base
	validates :name, presence: true
	validates :u_price, presence: true

	  def getIngredientsByProductId(product_id)
	  	@ingredients = Ingredients.where("product_id = ?", product_id)
	  end
end
