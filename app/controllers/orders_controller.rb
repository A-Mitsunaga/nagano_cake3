class OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm
    #@orders = current_customer.cart_items.all
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    if params[:address_status] == "ご自身の住所"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name

    elsif params[:address_status] == "登録済住所から選択"
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name

    else params[:address_status] == "新しいお届け先"
        params[:order][:postal_code] = @order.postal_code
        params[:order][:address] = @order.address
        params[:order][:name] = @order.name
    end

  end

  def thanks
  end

  def create
    #order = Order.new(order_params)
    #order.save!
    #redirect_to orders_thanks_path
    order = Order.new(order_params)
    if order.save!
    redirect_to orders_thanks_path
    #下記変更あり。購入後カートを空にしたい。
    #current_customer.cart_items.delete_all
    else
    render :new
    end
  end

  def index
    @orders = current_customer.orders.all
    #@order = Order.new
    #@cart_items = CartItem.all

  end

  def show
    @orders = Order.all
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items.all

  end


  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :billing_amount, :payment_method)
  end

end
