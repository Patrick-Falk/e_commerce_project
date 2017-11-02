ActiveAdmin.register LineItem do

  permit_params :quantity, :price, :order_id, :product_id

end
