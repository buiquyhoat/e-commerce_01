class Order < ApplicationRecord
  belongs_to :user, class_name: User.name
  has_many :order_details, class_name: OrderDetail.name, foreign_key: :order_id,
    dependent: :destroy

  validates :shipping_address, :shipping_name, :shipping_email, presence: :true

  scope :orders_history, -> user {where user_id: user.id}
end
