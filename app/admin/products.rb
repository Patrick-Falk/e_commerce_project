ActiveAdmin.register Product do

  permit_params :name, :description, :stock_quantity, :status, :category_id, :image

end

