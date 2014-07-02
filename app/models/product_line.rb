class ProductLine < ActiveRecord::Base
  belongs_to :product
  belongs_to :ingredient

  validates :amount , presence: true
  validates :product_id , presence: true
  validates :ingredient_id , presence: true

end
