class Order < ApplicationRecord
  belongs_to :customer
  has_many :lineItems
  has_many :products, through: :lineItems

end
