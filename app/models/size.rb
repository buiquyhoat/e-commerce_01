class Size < ApplicationRecord
  belongs_to :product, class_name: Product.name
end
