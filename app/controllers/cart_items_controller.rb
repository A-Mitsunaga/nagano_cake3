class CartItemsController < ApplicationController

  def index
  @items = Item.all
  end

  def update
  end

  def destroy
    cart_item = Cart_item.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
  end

  def create
  end

private
  def cart_item_params
    params.require(:curt_item).permit(:name, :price, :amount)
  end


end
