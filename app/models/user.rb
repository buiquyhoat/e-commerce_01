class User < ApplicationRecord
  has_many :favorites, class_name: Favorite.name, foreign_key: :user_id,
    dependent: :destroy
  has_many :comments, class_name: Comment.name, foreign_key: :user_id,
    dependent: :destroy
  has_many :suggest_products, class_name: SuggestProduct.name,
    foreign_key: :user_id, dependent: :destroy
  has_many :orders, class_name: Order.name, foreign_key: :user_id,
    dependent: :destroy
end
