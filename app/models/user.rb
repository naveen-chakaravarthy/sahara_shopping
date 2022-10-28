class User < ApplicationRecord
  has_secure_password
  has_many :cart_item
  has_many :order

  before_validation :store_username, on: :create
  validates :email, confirmation: true, uniqueness: true
  validates :first_name, :address, presence: true
  validates :password, length: { in: 8..20 }

  private
  def store_username
    self.username = email.split('@')[0]
  end
end