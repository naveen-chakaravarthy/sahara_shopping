class User < ApplicationRecord
  has_secure_password
  validates :email, confirmation: true, uniqueness: true
  validates :first_name, :address, presence: true
  validates :password, length: { in: 6..20 }
  has_many :cart_item
  has_many :order
end