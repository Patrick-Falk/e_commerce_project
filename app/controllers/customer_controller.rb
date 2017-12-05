class CustomerController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer
    else
      render 'new'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :address, :city, :country, :postal_code, :province_id)
  end
end
