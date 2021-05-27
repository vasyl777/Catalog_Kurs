class PagesController < ApplicationController
  def index
    @sweet_products = SweetProduct.limit(8).with_attached_image.includes(:categories)
  end
end
