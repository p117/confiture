class Product < ActiveRecord::Base

  has_many :product_lines, :dependent => :delete_all
  has_many :ingredients, through: :product_lines
  belongs_to :jar
  has_many :order_lines
  has_many :orders, through: :order_lines

  validates :name , presence: true
  validates :u_price , presence: true
  validates :profit , presence: true

  after_update :save_historic
  def save_historic
    @pht = self.attributes
    @pht["product_id"] = @pht["id"]
    @pht.delete('id')
    @pht.delete('photo')
    @pht.delete('jar_id')
    @ph = ProductHistoric.create(@pht)
  end
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
  def save_product_dependencies(ing,uploaded_io)
    cpt = 0
    ing.each do |i|
      self.add_order_line(i,cpt)
      cpt = cpt+1
    end
    upload_picture(uploaded_io)
  end
  def upload_picture(uploaded_io)
    self.u_price = self.get_u_price
    if uploaded_io
      ext = uploaded_io.original_filename.split('.').last.to_s
      picture = Time.now.to_i.to_s+"."+ext
      self.photo = picture
    end
    self.save
    if self.photo
      File.open(Rails.root.join('public', 'uploads', self.photo), 'wb') do |file|
        file.write(uploaded_io.read)
      end
    end
  end
end


