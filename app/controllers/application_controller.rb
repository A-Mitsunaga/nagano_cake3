class ApplicationController < ActionController::Base
# strong parameter
#before_action :authenticate_customer!,except: [:top, :about]
before_action :configure_permitted_parameters, if: :devise_controller?

  # 管理者とユーザのログイン後の遷移
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when Customer
    customers_my_page_path
    end
  end

#protect_from_forgery with: :exception
#helper_method :current_cart

  #def current_cart_item
    #if current_customer
      #current_cart_items = current_customer.cart_items || current_customer.create_cart_items!
    #end
  #end





protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
end
end
