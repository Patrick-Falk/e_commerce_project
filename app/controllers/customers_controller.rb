class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    new_customer = Customer.new(customer_params)
    # session[:customer] = new_customer
    @customer = new_customer

    if @customer.save
      redirect_to :controller => 'order', :action => 'invoice', :variable => new_customer
    else
      render 'new'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :address, :city, :country, :postal_code, :province_id)
  end
end
