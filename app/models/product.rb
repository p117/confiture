class Product < ActiveRecord::Base

  has_many :product_lines, :dependent => :delete_all
  has_many :ingredients, through: :product_lines
  belongs_to :jar
  has_many :order_lines
  has_many :orders, through: :order_lines

  validates :name , presence: true
  validates :u_price , presence: true
  validates :profit , presence: true

  def add_order_line(ingredient,cpt)
    @pl = ProductLine.new({amount: ingredient[1],product_id: self.id,ingredient_id: ingredient[0]})
    @pl.save
  end
  def get_u_price
  	u_price = 0.0
  	ingredients.each do |i|
  		u_price = u_price + (i.u_price*product_lines.where(:product_id => id,:ingredient_id => i.id).first.amount)
  	end
  	u_price = u_price + profit + jar.price
  end
end


