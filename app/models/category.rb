class Category < ApplicationRecord
  has_many :category_sweet_products
  has_many :sweet_products, through: :category_sweet_products
end
