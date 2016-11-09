class User < ApplicationRecord
  has_many :favorites, class_name: Favorite.name, foreign_key: :user_id,
    dependent: :destroy
  has_many :comments, class_name: Comment.name, foreign_key: :user_id,
    dependent: :destroy
  has_many :suggest_products, class_name: SuggestProduct.name,
    foreign_key: :user_id, dependent: :destroy
  has_many :orders, class_name: Order.name, foreign_key: :user_id,
    dependent: :destroy

  attr_accessor :remember_token
  validates :name , presence: true, length: {maximum: Settings.name_size_max}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.password_min},
    allow_nil: true

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST
        : BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  def forget
    update_attributes remember_digest: nil
  end

  def self.is_user? user
    user == current_user
  end

  private
  def downcase_email
    self.email = email.downcase
  end
end
