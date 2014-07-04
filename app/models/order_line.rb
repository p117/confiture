class OrderLine < ActiveRecord::Base
  belongs_to :product
  belongs_to :order, :dependent => :delete

  validates :amount , presence: true
  validates :product_id , presence: true
  validates :order_id , presence: true

   before_destroy :delete_order
  def delete_order
  	 @pht = self.attributes
  	 p @pht['order_id']
  	 Order.delete(@pht['order_id'])
  end
end
