class Product < ApplicationRecord
  belongs_to :category
  has_many :lineItems
  has_many :orders, through: :lineItems

  def self.filter(product)
    if product
      if product[:category_id] != ''
    # if product[:category_id]
        where(category_id: product[:category_id])
      else
        all
      end
    else
      all
      # where(category_id: 1)
    end
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%").or(where('description LIKE ?', "%#{search}%"))
    else
      all
    end
  end
end
