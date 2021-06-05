class OrdersController < ApplicationController
  def new
    @orders =  Order.all
    #@customer = Customer.find(current_customer_params)
  end

  def confirm
    @cart_items = CartItem.all
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
    #@items = Item.all
  end
end
