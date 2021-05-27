# frozen_string_literal: true

class SweetProductComponent < ViewComponent::Base
  include SweetProductsHelper
  def initialize(sweet_product:)
    @sweet_product = sweet_product
  end
end
