# frozen_string_literal: true

class CatalogComponent < ViewComponent::Base
  def initialize(sweet_products:, categories:)
    @sweet_products = sweet_products
    @categories = categories
  end
end
