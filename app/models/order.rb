class Order < ApplicationRecord
  has_many :order_item
  belongs_to :user

  def self.pending_orders
    orders = Order.where(status: "pending")
  end
  def self.cancelled_orders
    Order.find_by(status: "cancelled")
  end
  def self.delivered_orders
    Order.find_by(status: "delivered")
  end
end