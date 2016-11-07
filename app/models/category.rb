class Category < ApplicationRecord
  has_many :products, class_name: Product.name, foreign_key: :category_id
end
