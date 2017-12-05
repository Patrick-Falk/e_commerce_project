require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  test "should get new_order" do
    get order_new_order_url
    assert_response :success
  end

  test "should get confirm_address" do
    get order_confirm_address_url
    assert_response :success
  end

  test "should get confirm_invoice" do
    get order_confirm_invoice_url
    assert_response :success
  end

  test "should get process_payment" do
    get order_process_payment_url
    assert_response :success
  end

end
