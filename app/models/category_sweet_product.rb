class CategorySweetProduct < ApplicationRecord
  belongs_to :category
  belongs_to :sweet_product
end
