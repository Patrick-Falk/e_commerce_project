class ClarifyProvincesColumnNames < ActiveRecord::Migration[5.1]
  def change
    change_table :provinces do |t|
      t.rename :pst, :pst_rate
      t.rename :gst, :gst_rate
      t.rename :hst, :hst_rate
    end
  end
end
