class Admin::ItemsController < ApplicationController

  def index
    @item = Item.new
    @items = Item.all
  end

  def new
    #@item_image = ItemImage.new
    @item = Item.new
  end

  def create
    #@item_image = ItemImage.new
    #@item_image.save
    #redirect_to admin_items_path
    @item = Item.new
    @item.save
    redirect_to admin_items_path
  end

  def show
  end

end
