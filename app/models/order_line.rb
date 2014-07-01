class OrderLine < ActiveRecord::Base
  has_one :products
  has_one :orders

  validates :amount , presence: true
  validates :product_id , presence: true
  validates :order_id , presence: true

  def method_name
  	
  end
end
