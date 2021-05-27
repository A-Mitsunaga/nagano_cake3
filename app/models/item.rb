class Item < ApplicationRecord
  attachment :image
  belongs_to :genre, optional: true
  enum is_active: { '販売中': true,'販売中止': false }
end
