class Product < ActiveRecord::Base
  has_many :ingredients
  has_one :jar
  has_many :order_lines
  has_many :orders, through: :order_lines

  validates :name , presence: true
  validates :u_price , presence: true
  validates :profit , presence: true
  #validates :jar_id, presence: true
  #validates :photo , presence: true

end
