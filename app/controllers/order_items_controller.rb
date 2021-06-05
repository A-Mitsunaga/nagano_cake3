class OrderItemsController < ApplicationController

  def index
     @order_items = OrderItem.all

    # @order_item = OrderItem.find(params[:id])
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

private
  def order_itemitem_params
    params.require(:order_item).permit(:name, :postal_code, :address)
  end

end
