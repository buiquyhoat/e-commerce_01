class User < ApplicationRecord
  has_many :favorites, class_name: Favorite.name, foreign_key: :user_id,
    dependent: :destroy
  has_many :comments, class_name: Comment.name, foreign_key: :user_id,
    dependent: :destroy
  has_many :suggest_products, class_name: SuggestProduct.name,
    foreign_key: :user_id, dependent: :destroy
  has_many :orders, class_name: Order.name, foreign_key: :user_id,
    dependent: :destroy

  validates :name , presence: true, length: {maximum: Settings.name_size_max}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.password_min},
    allow_nil: true
end
