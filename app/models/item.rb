class Item < ApplicationRecord
  attachment :image
  has_many :cart_items
  
  enum is_active: { '販売中': true,'販売中止': false }
end
