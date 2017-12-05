class OrderController < ApplicationController
  def address
    @customer = Customer.new
  end

  def invoice
  end

  def payment
  end

  # def process_payment
  # end
end
