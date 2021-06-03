class ItemsController < ApplicationController
def index
  @items = Item.all
end

def show
  @item = Item.find(params[:id])
  @cart_item = CartItem.new
end

private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :is_active)
  end

end

