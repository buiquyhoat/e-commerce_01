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
end
