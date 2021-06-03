class OrdersController < ApplicationController
  def new
    @orders =  Order.all
  end

  def confirm
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
