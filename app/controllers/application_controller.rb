class ApplicationController < ActionController::Base
  before_action :set_locale
  $PER_PAGE = 12

  private

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
    @locale = params[:locale] = I18n.locale
  end

  def default_url_options(options = {})
    {
      locale: I18n.locale
    }.merge options
  end

  def extract_locale
    params[:locale] || http_accept_language.compatible_language_from(I18n.available_locales).to_s
  end

  def sweet_products
    @sweet_products ||= SweetProduct.all
  end
  #
  # def find_in_text
  #   pp SweetProduct.includes(:action_text_rich_text).where("action_text_rich_text.body LIKE '%#{params[:search]&.downcase}%'")
  # end

  def search
    # find_in_text
    if (@search = params[:search])
      @sweet_products = sweet_products.where("lower(name) LIKE '%#{params[:search]&.downcase}%'")
    end
  end

  def pagination
    @count = sweet_products.count
    @sweet_products = sweet_products.page(page).per($PER_PAGE).with_attached_image.includes(:categories)
  end

  def page
    @page ||= (params[:page] || 1).to_i
  end
end
