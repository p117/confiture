class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  def new
    @order = Order.new
  end
  def create
    @order = Order.new(order_params)
    if @order.save
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

    if @order.update(params[:order].permit(:global_price,:customer_id))
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
  def get_customers
    @customer = Customer.all
  end
  def order_params
    params.require(:order).permit(:global_price,:customer_id)
  end
end