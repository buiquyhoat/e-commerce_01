class Color < ApplicationRecord
  belongs_to :product, class_name: Product.name, optional: true, inverse_of: :colors
end
