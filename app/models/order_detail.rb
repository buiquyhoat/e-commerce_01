class OrderDetail < ApplicationRecord
  belongs_to :order, class_name: Order.name
  belongs_to :product, class_name: Product.name
end
