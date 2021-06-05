class OrdersController < ApplicationController
  def new
    #@order = Order.new
    #@orders =  Order.all
    @customers = Customer.all#全員の住所を表示する
    #@customer = Customer.find(customer_id: params[:customer_id])
  end

  def confirm
    @cart_items = CartItem.all
    @orders = Order.all

    @order = Order.new
    #@cart_items = current_customer.cart_items

    #@order.payment_method = params[:order][:payment_method]

  end

  def thanks
  end

  def create
    @order = current_customer.order.build(order_params)
  end

  def index
  end

  def show
    #@items = Item.all
  end


  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :billing_amount)
  end

end
