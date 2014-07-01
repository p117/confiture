class ProductLine < ActiveRecord::Base
  has_one :products
  has_one :ingredients

  validates :amount , presence: true
  validates :product_id , presence: true
  validates :ingredient_id , presence: true

end
