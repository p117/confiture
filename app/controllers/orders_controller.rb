class OrdersController < ApplicationController
  before_filter :check_access

  def index
    @orders = Order.all
  end
  def new
    @order = Order.new
    @products = Product.all
  end
  def create
    @order = Order.new(order_params)
    @products = params[:product]
    @price = @order.calculate_price(@products)
    @order.global_price = @price
    if @order.save
      @order.create_orderline(@products, @order.id)
      redirect_to @order
    else
      render "new"
    end
  end
  def show 
    @order = Order.find(params[:id])
    @customer = Customer.find(@order.customer_id)
    @order_lines = OrderLine.where(order_id: @order.id)
  end
  def edit
    @order = Order.find(params[:id])
  end
  def update
    @order = Order.find(params[:id])
    if @order.update(params[:order].permit(:customer_id))
        redirect_to @order
      else
        render 'edit'
      end
  end
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
 
      redirect_to orders_path
  end
  def order_params
    params.require(:order).permit(:customer_id)
  end
  helper_method :find_product
  def find_product(product_id)
    @product = Product.find(product_id)
    return @product.name
  end
end