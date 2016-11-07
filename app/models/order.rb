class Order < ApplicationRecord
  belongs_to :user, class_name: User.name
  has_many :order_details, class_name: OrderDetail.name, foreign_key: :order_id,
    dependent: :destroy
end
