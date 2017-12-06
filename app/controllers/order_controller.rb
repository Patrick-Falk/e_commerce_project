class OrderController < ApplicationController
  def address
    @customer = Customer.new
  end

  def invoice
    # prep customer
    customer_id = params[:variable]
    customer = Customer.find(customer_id.to_i)
    @customer = customer
    @province = Province.find(customer.province_id)

    # create new order object
    order = Order.new(customer_id: customer_id.to_i)
    @order = order

    # create object containing line items, and populate lineitems... potentially refactor into model
    product_ids = session[:shopping_cart]
    line_items = []
    product_ids.each do |product_id|
      product = Product.find(product_id)
      line_item = LineItem.create(order_id: order.id,
                                  product_id: product.id,
                                  quantity: 1,
                                   price: product.price)
      line_items << line_item
    end
    @line_items = line_items

    # Calculate Subtotal
    subtotal = 0
    line_items.each {|li| subtotal += (li.price * li.quantity)}
    @subtotal = subtotal


    # total =
    # @products
  end

  def payment
  end

  # def process_payment
  # end
end
