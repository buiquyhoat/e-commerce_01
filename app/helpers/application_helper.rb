module ApplicationHelper
  def price_each_product_in_cart product, quantity
    return product.price.to_i * quantity.to_i
  end

  def get_short_description product
    return product.description.byteslice(0,60)
  end
end
