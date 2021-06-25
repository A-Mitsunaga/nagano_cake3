class Customer < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

   enum is_active: { "有効": true, "退会": false }
  #enum is_active: { Available: true, Invalid: false }

  def active_for_authentication?
        super && (self.is_active === "有効")
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    return last_name + first_name
  end

end
