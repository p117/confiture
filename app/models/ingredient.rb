class Ingredient < ActiveRecord::Base
	has_many :product_lines
	has_many :products, through: :product_lines, :dependent => :destroy
  #has_many :ingredient_historics, :dependent => :delete_all


	validates :name, presence: true
	validates :u_price, presence: true

	after_save :save_historic
  def save_historic
    @ing = self.attributes
    @ing["ingredient_id"] = @ing["id"]
    @ing.delete('id')
    @i = IngredientHistoric.create(@ing)  
  end
end
