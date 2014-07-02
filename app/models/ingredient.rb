class Ingredient < ActiveRecord::Base
	has_many :product_lines
	has_many :products, through: :product_lines
	validates :name, presence: true
	validates :u_price, presence: true

end
