class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  def new
    @order = Order.new
    @products = Product.all
  end
  def create
    @order = Order.new(order_params)
    @order.global_price = 10
    if @order.save
      OrderLine.new(@order.id, @order.customer_id)
      p @order.id
      redirect_to @order
    else
      render "new"
    end
  end
  def show 
    @order = Order.find(params[:id])
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
end