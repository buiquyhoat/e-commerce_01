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

  def self.best_seller
    product_ids = "select order_details.product_id
      from order_details
      where (julianday('now') - julianday(order_details.created_at))
      < #{Settings.product.limit_date}
      group by order_details.product_id
      order by sum(order_details.quantity) desc
      limit #{Settings.product.limit}"
    Product.where("id IN (#{product_ids})")
  end

  def self.newest
    Product.order(created_at: :desc).limit(Settings.product.limit)
  end
end
