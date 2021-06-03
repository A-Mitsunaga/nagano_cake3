class CartItemsController < ApplicationController
#before_action :setup_cart_item!, only: [:create, :index, :destroy, :destroy_all]
  def index
   @cart_items = CartItem.all
   
   #@cart_items = CartItem.all
   #@item = Item.find(params[:id])
  end

  def update
    @cart_item.update(amount params[:amount])
    redirect_to current_cart
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.customer == current_customer
      @cart_item.save
      redirect_to cart_items_path
    else
      redirect_to item_path
    end
  end

private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

  def setup_cart_item!
    @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
  end
end

