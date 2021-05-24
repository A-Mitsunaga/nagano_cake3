class Item < ApplicationRecord
  attachment :image
  enum is_active: { '販売中': true,'販売中止': false }
end
