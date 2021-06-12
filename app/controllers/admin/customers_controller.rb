class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer.id)
    redirect_to admin_customer_path(customer.id)
  end

private
  def list_params
    params.require(:customer).permit(:name, :email, :customer_id)
  end

end
