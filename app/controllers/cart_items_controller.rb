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
  @cart_item = current_customer.cart_items.build(cart_item_params)
  @cart_items = current_customer.cart_items.all
  @cart_items.each do |cart_item|
    if cart_item.item_id == @cart_item.item_id
      new_amount = cart_item.amount + @cart_item.amount
      cart_item.update_attribute(:amount, new_amount)
      @cart_item.delete
    end
  end
  @cart_item.save
  redirect_to :cart_items
end



private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

  def setup_cart_item!
    @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
  end
end

