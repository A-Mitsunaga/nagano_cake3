class Admin::OrdersController < ApplicationController

  def show
    @cart_items = CartItem.all
    @order = Order.find(params[:id])
  end

  def update
  end

private
  def customer_params
    params.require(:order).permit(:amount)
  end
end