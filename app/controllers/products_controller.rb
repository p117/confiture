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
    @product.u_price = 0
    if @product.save
      @product.save_product_dependencies(@ingredients,uploaded_io)
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
    if @product.update(params[:product].permit(:name,:u_price, :profit))
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