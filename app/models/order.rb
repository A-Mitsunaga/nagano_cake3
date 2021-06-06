class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
    enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
    enum address_status: { ご自身の住所: 0, 登録済住所: 1, 新しい住所: 2 }
end
