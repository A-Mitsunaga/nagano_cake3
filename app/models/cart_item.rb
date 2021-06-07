class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  attachment :image
  #def subtotal_price
    #item.price * amount
  #end

  def subtotal_price
		items.sum { |item| item.subtotal_price }
	 end
   # def total_price
	#item.sum { |item| item.total_price }
	#end

  #def total_price
   # item.sum { |item| item.total_price }
  #end
#array = []
#Item.all.each do |book|
#array << item.price
#end
#array.sum
end
