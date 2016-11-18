class Order < ApplicationRecord
  belongs_to :user, class_name: User.name
  has_many :order_details, class_name: OrderDetail.name, foreign_key: :order_id,
    dependent: :destroy

  validates :shipping_address, :shipping_name, :shipping_email, presence: :true
  scope :orders_history, -> user {where user_id: user.id}
  scope :order_count, -> date_time do
    where("date(created_at) = '#{date_time}'").count
  end

  class << self
    def orders_history user
      where(user_id: user.id).order(created_at: :desc)
    end
  end
end
