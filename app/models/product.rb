class Product < ApplicationRecord
  belongs_to :category
  has_many :lineItems
  has_many :orders, through: :lineItems

end
