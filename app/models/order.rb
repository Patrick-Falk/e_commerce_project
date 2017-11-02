class Order < ApplicationRecord
  belongs_to :customer
  has_many :lineitems
  has_many :products, through: :lineitems

end
