module SweetProductsHelper
  def sweet_product_image(image, width: 200, height: 200)
    image_tag (image.attached? ? image : '/nfd.jpg'), width: width, height: height, class: 'image'
  end
end
