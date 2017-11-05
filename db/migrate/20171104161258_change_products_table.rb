class ChangeProductsTable < ActiveRecord::Migration[5.1]
  def change
    change_table :products do |t|
      t.remove :status
      t.decimal :price
      t.decimal :sale_price
      t.string :image
    end
  end
end
