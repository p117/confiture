class ProductLine < ActiveRecord::Base
  belongs_to :product, :dependent => :delete
  belongs_to :ingredient

  validates :amount , presence: true
  validates :product_id , presence: true
  validates :ingredient_id , presence: true

end
