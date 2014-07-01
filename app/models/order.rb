class Order < ActiveRecord::Base
  has_many :products
  has_one :customers

  validates :global_price , presence: true
  validates :customer_id , presence: true

end
