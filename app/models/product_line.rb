class ProductLine < ActiveRecord::Base
  belongs_to :product, :dependent => :delete
  belongs_to :ingredient

  validates :amount , presence: true
  validates :product_id , presence: true
  validates :ingredient_id , presence: true

  before_destroy :delete_product
  def delete_product
  	 @pht = self.attributes
  	 p @pht['product_id']
  	 Product.delete(@pht['product_id'])
  end
end
