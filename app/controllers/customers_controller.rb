class CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(current_customer_params)
  end

  def update
    customer = Customer.find(current_customer)
    customer.update(customer_params)
    redirect_to customer_my_page_path(customer.id)
  end

end
