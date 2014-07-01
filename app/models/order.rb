class Order < ActiveRecord::Base
  has_many :products
  has_one :customers

  validates :customer_id , presence: true

end
