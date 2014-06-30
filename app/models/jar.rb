class Jar < ActiveRecord::Base
  has_many :products
  has_one :
  validates :name , presence: true
  validates :u_price , presence: true
  validates :profit , presence: true
  validates :photo , presence: true

end
