class Order < ActiveRecord::Base
  has_many :order_lines
  has_many :products, through: :order_lines
  has_one :customer

  validates :customer_id , presence: true

   def calculate_price(products)
      @res = 0
      products.each do |i|
          @product = Product.find(i[0])
          @res += i[1].to_f * @product.u_price.to_f
      end
      return @res
  end
  def create_orderline(product, order_id)
    product.each do |i|
        if i[1] != 0
          @orderline = OrderLine.new({amount: i[1], product_id: i[0], order_id: order_id})
          @orderline.save
        end
      end
  end

end
