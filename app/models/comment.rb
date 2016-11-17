class Comment < ApplicationRecord
  belongs_to :product, class_name: Product.name
  belongs_to :user, class_name: User.name

  class << self
    def newest
      Comment.order(created_at: :desc)
    end
  end
end
