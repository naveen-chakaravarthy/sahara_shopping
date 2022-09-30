class User < ApplicationRecord
  has_secure_password
  has_many :cart_item
end