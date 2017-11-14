class Product < ApplicationRecord
  belongs_to :category
  has_many :lineItems
  has_many :orders, through: :lineItems

  # scope :category, lambda{|category| where('category_id = ?', category)}

  def self.filter(product)
    if product
      if product[:category_id] != ''
        where(category_id: product[:category_id])
      else
        where(nil)
      end
    else
      where(nil)
    end
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%").or(where('description LIKE ?', "%#{search}%"))
    else
      where(nil)
    end
  end
end
