class Order < ApplicationRecord
  has_many :order_item
  belongs_to :user
end