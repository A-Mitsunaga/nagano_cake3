class CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    current_customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdrawal
    @customer = current_customer
  #customer = current_customer
  @customer.update(is_active: false)
  redirect_to root_path
  end


private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end

end
