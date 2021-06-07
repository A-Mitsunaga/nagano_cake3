class OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
    @cart_items = CartItem.all
    @orders = Order.all
    @order = Order.new(order_params)
    if params[:order][:address_status] == "ご自身の住所"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name

    elsif params[:order][:address_status] == "登録済住所から選択"
        @address = Address.find(params[:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name


    else params[:order][:address_status] == "新しいお届け先"
        params[:order][:postal_code] = @order.postal_code
        params[:order][:address] = @order.address
        params[:order][:name] = @order.name

    end

    end
  def thanks
  end

  def create


  end

  def index
    @orders = Order.all
  end

  def show
  end


  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :billing_amount, :payment_method)
  end

end
