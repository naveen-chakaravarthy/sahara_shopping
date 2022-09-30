class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  def self.my_orders(current_user_id)
    user = User.find_by(id: current_user_id)
    user.order.all
  end
  def self.my_order_items(order_id)
    order = Order.find_by(id: order_id)
    order.order_item.all
  end
end