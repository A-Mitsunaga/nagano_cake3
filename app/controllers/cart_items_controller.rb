class CartItemsController < ApplicationController
  #before_action :setup_cart_item!, only: [:create, :index, :destroy, :destroy_all]


  def index
  @cart_items = CartItem.all
  #@items = Item.all
  end

  def update
    @cart_item.update(amount params[:amount])
    redirect_to current_cart
  end

  def destroy
    cart_item = Cart_item.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
  end

  def create
   # if  @cart_item.blank?
        #@cart_item = current_cart.cart_items.build(item_id: params[:item_id])
    #end

    @cart_item = CartItem.new(cart_item_params)
    #@cart_item.anount += params[:amount]
    @cart_item.save
    redirect_to cart_items_path
  end

private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

  def setup_cart_item!
    @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
  end

end

