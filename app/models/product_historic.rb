class ProductHistoric < ActiveRecord::Base

  validates :product_id , presence: true
  validates :u_price , presence: true
  validates :profit , presence: true
  
end
