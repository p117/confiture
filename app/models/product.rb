class Product < ActiveRecord::Base
<<<<<<< HEAD
  has_many :product_lines
  has_many :ingredients, through: :product_lines
  belongs_to :jar
=======
  has_many :ingredients
  has_one :jar
  has_many :order_lines
  has_many :orders, through: :order_lines
>>>>>>> 24bb343a4314068c758f2c82a84115c7af87cd54

  validates :name , presence: true
  validates :u_price , presence: true
  validates :profit , presence: true
  #validates :jar_id, presence: true
  #validates :photo , presence: true

  def add_order_line(ingredient,cpt)
    @pl = ProductLine.new({amount: ingredient[1],product_id: self.id,ingredient_id: ingredient[0]})
    @pl.save
  end
  def get_u_price
  	self.u_price = 0
  	self.ingredients.each do |i|
  		self.u_price = self.u_price.to_f + i.u_price.to_f
  	end
  	self.u_price.to_f = self.u_price.to_f + self.profit.to_f + self.jar.price.to_f
  end
end
