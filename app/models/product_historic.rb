class ProductHistorics < ActiveRecord::Base

	validates :name , presence: true
  validates :u_price , presence: true
  validates :profit , presence: true
  
end
