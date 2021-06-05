class Address < ApplicationRecord
  #belongs_to customers
  #belongs_to :order
  #belongs_to :item
  def postal_code_address_name
    return postal_code + address + name
  end
end
