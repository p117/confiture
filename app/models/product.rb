class Product < ActiveRecord::Base
  has_many :ingredients
  has_one :jars
  validates :name , presence: true
  validates :u_price , presence: true
  validates :profit , presence: true
  validates :photo , presence: true

end
