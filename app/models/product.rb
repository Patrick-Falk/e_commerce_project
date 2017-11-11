class Product < ApplicationRecord
  belongs_to :category
  has_many :lineItems
  has_many :orders, through: :lineItems

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%").or(where('description LIKE ?', "%#{search}%"))
    else
      all
    end
  end
end
