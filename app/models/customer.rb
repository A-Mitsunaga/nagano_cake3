class Customer < ApplicationRecord
  #has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  enum is_active: { '有効': true,'退会済': false }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def full_name
    self.first_name + self.last_name
  end

end
