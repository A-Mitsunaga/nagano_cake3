class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
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
