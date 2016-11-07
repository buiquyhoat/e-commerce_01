class Color < ApplicationRecord
  belongs_to :product, class_name: Product.name
end
