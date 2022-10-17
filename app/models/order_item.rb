class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  def self.pending_orders
    user = OrderItem.find_by(status: "pending")
    user.order.all
  end
  def self.cancelled_orders
    user = OrderItem.find_by(status: "cancelled")
    user.order.all
  end
  def self.delivered_orders
    user = OrderItem.find_by(status: "delivered")
    user.order.all
  end

  def self.my_order_items(order_id)
    order = Order.find_by(id: order_id)
    order.order_item.all
  end
end