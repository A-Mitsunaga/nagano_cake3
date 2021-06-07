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

  def unsustainable
    @customer = Customer.find_by(name: params[:name])
  end

  def withdrawal
  @customer = Customer.find_by(name: params[:name])
  @customer.update(is_valid: false)
  resset_session
  redirect_to root_path
  end


private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end
