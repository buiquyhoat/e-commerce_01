class Order < ApplicationRecord
  belongs_to :user, class_name: User.name
  has_many :order_details, class_name: OrderDetail.name, foreign_key: :order_id,
    dependent: :destroy

  validates :shipping_address, :shipping_name, :shipping_email, presence: :true

  class << self
    def orders_history user
      where(user_id: user.id).order(created_at: :desc)
    end
  end
end
