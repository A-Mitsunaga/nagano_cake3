class Admin::HomesController < ApplicationController

  def top
   #@orders = Order.all
   @orders = Order.all.order(order_id: :asc).page(params[:page]).per(3)
  end

end
