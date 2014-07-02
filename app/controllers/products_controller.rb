class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def new
    @product = Product.new
    @ingredients = Ingredient.all
  end
  def create
    @product = Product.new(product_params)
    uploaded_io = params[:photo]
    @product.jar_id = params[:jar_id][:id]
    @ingredients = params[:ingredient_ids]
    if uploaded_io
      ext = uploaded_io.original_filename.split('.').last.to_s
      picture = Time.now.to_i.to_s+"."+ext
      @product.photo = picture
    end
    @product.u_price = 0
    if @product.save
      cpt = 0
      @ingredients.each do |i|
        @product.add_order_line(i,cpt)
        cpt = cpt+1
      end
      @product.u_price = @product.get_u_price
      @product.save
      if @product.photo
        File.open(Rails.root.join('public', 'uploads', @product.photo), 'wb') do |file|
          file.write(uploaded_io.read)
        end
      end
      redirect_to @product
    else
      render "new"
    end
  end
  def show 
    @product = Product.find(params[:id])
    
  end
  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(params[:product].permit(:name,:u_price, :profit, :photo))
      redirect_to @product
    else
      render 'edit'
    end
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
 
    redirect_to products_path
  end
  def product_params
    params.require(:product).permit(:name, :u_price, :profit, :jar_id, :photo)
  end
end