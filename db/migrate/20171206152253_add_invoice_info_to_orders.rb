class AddInvoiceInfoToOrders < ActiveRecord::Migration[5.1]
  def change
    change_table :orders do |t|
      t.decimal :subtotal
      t.decimal :pst_amount
      t.decimal :gst_amount
      t.decimal :hst_amount
      t.decimal :total
    end
  end
end
