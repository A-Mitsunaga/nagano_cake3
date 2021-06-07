class Item < ApplicationRecord
  attachment :image
  has_many :cart_items
  enum is_active: { '販売中': true,'販売中止': false }

  def subtotal_price
    item.price * amount
  end

  #def subtotal_price
		#items.sum { |item| item.subtotal_price }
	#end

end
