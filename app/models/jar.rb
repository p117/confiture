class Jar < ActiveRecord::Base
  has_many :products, :dependent => :delete_all

  validates :price , presence: true
  validates :text , presence: true

end
