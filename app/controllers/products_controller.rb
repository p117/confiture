class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    uploaded_io = params[:photo]
    @product.photo = uploaded_io.original_filename
    @product.jar_id = params[:jar_id][:id]
    if @product.save
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
       file.write(uploaded_io.read)
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