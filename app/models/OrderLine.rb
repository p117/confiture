class OrderLine < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :amount , presence: true
  validates :product_id , presence: true
  validates :order_id , presence: true
end
