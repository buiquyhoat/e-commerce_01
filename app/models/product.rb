class Product < ApplicationRecord
  belongs_to :category, class_name: Category.name
  has_many :favorites, class_name: Favorite.name, foreign_key: :product_id,
    dependent: :destroy
  has_many :comments, class_name: Comment.name, foreign_key: :product_id,
    dependent: :destroy
  has_many :order_details, class_name: OrderDetail.name, foreign_key: :product_id
  has_many :colors, class_name: Color.name, foreign_key: :product_id,
    dependent: :destroy
  has_many :sizes, class_name: Size.name, foreign_key: :product_id,
    dependent: :destroy
  class << self
    def best_seller
      product_ids = "select order_details.product_id
        from order_details
        where (julianday('now') - julianday(order_details.created_at))
        < #{Settings.product.limit_date}
        group by order_details.product_id
        order by sum(order_details.quantity) desc
        limit #{Settings.product.limit}"
      Product.where("id IN (#{product_ids})")
    end

    def newest
      Product.order(created_at: :desc).limit(Settings.product.limit)
    end

    def recent_views array_recent_product
      array_recent_product.empty? ? [] :
        Product.where("id IN (#{array_recent_product.join(",")})")
    end

    def search product_name, category_id, min_price, max_price, min_quantity,
      max_quantity
      products = Product.all
      products = products.where(
        "product_name LIKE ?","%#{product_name}%") if product_name.present?
      products = products.where(
        "category_id  = ?", category_id.to_i) if category_id.present?
      products = products.where(
        "price >= ?", min_price.to_i) if min_price.present?
      products = products.where(
        "price <= ?", max_price.to_i) if max_price.present?
      products = products.where(
        "quantity >= ?", min_quantity.to_i) if min_quantity.present?
      products = products.where(
        "quantity <= ?", max_quantity.to_i) if max_quantity.present?
      products
    end
  end
end
