class Order < ApplicationRecord
  belongs_to :customer
  has_many :lineItems
  has_many :products, through: :lineItems

  # def calculate_subtotal
  #
  # end

  def calculate_taxes
    pst_amount = self.subtotal * self.pst_rate
    gst_amount = self.subtotal * self.gst_rate
    hst_amount = self.subtotal * self.hst_rate
    self.update(pst_amount: pst_amount,
                gst_amount: gst_amount,
                hst_amount: hst_amount)
  end

  def calculate_total
    total = self.subtotal + self.pst_amount + self.gst_amount + self.hst_amount
    self.update(total: total)
  end
end
