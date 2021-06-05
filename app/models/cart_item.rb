class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

#array = []
#Item.all.each do |book|
#array << item.price
#end
#array.sum
end
