class SuggestProduct < ApplicationRecord
  belongs_to :user, class_name: User.name

  validates :product_name, presence: :true, length: {minimum:5, maximum: 40}
  validates :product_description, length: {maximum: 500}
end
