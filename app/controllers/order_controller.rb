class OrderController < ApplicationController
  def address
    @customer = Customer.new
  end

  def invoice
    # prep customer
    customer_id = params[:variable]
    customer = Customer.find(customer_id.to_i)
    @customer = customer

    # prep province
    province = Province.find(customer.province_id)
    @province = province

    # create new order object
    order = Order.create(customer_id: customer_id.to_i,
                         pst_rate: province.pst_rate,
                         gst_rate: province.gst_rate,
                         hst_rate: province.hst_rate,
                         status: "Initiated",
                         pst_amount: 0, gst_amount: 0, hst_amount: 0)

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
    order.update(subtotal: subtotal)

    # calculate taxes
    order.calculate_taxes

    # calculate total
    order.calculate_total
    session[:order] = order
    @order = order
  end

  def confirm
    # confirm placement of order
    order = session[:order]
    order.update(status: "Confirmed")

    session[:shopping_cart] = []
    session[:order] = []
  end

  # def payment
  # end

  # def process_payment
  # end
end
