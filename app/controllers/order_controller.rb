class OrderController < ApplicationController
  def address
    @customer = Customer.new
  end

  def invoice
    # create new order object

  end

  def payment
  end

  # def process_payment
  # end
end
