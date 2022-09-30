class User < ApplicationRecord
  has_secure_password
  has_many :cart_item
  has_many :order
end