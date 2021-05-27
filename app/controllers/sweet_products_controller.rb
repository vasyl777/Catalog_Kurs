class SweetProductsController < ApplicationController
  before_action :categories, only: %i[index search]

  def index
    search
    unless (@sugar_substitute = params[:sugar_substitute]).blank?
      @sweet_products = sweet_products.where(sugar_substitute: @sugar_substitute)
    end

    pagination
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @sweet_product = SweetProduct.find(params[:id])
  end

  private

  def categories
    @categories ||= Category.all
  end
end
