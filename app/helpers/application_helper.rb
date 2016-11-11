module ApplicationHelper
  def price_each_product_in_cart product, quantity
    return product.price.to_i * quantity.to_i
  end
end
