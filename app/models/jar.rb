class Jar < ActiveRecord::Base
  has_many :products

  validates :price , presence: true
  validates :text , presence: true
  
end
