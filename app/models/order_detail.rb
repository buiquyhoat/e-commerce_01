class OrderDetail < ApplicationRecord
  belongs_to :order, class_name: Order.name
  belongs_to :product, class_name: Product.name

  before_save :update_order_detail

  scope :get_list_order_detail, -> order {where order_id: order.id}

  private
  def update_order_detail
    total_amount = 0
    OrderDetail.get_list_order_detail(order).each do |order_detail|
      product = order_detail.product
      new_quantity = product.quantity - order_detail.quantity
      product.update_attribute :quantity, new_quantity
      total_amount += (order_detail.quantity * product.price.to_i)
    end
    order.update_attribute :total_amount, total_amount
  end
end
