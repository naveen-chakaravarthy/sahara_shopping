class OrdersController < ApplicationController
  def my_orders
    render "my_orders"
    end

  def admin_orders
    render "admin_orders"
  end

  def proceed_checkout
    user_id = @user.id
    order = Order.create!(date: DateTime.now, user_id: user_id)
    cart_items = @user.cart_item.all
    cart_items.each do |item|
      OrderItem.create!(order_id: order.id, menu_item_id: item.menu_item_id, menu_item_name: item.menu_item_name,
                        menu_item_price: item.menu_item_price, count: item.count)
      item.destroy
    end

    flash[:info] = "Order placed succesfully"
    redirect_to my_orders_path
  end

  def my_order_details
    order_id = params[:order_id]
    render "my_order_details", locals: {order_id: order_id}
  end

  def set_status
    order_id = params[:order_id]
    status = params[:status]
    Order.find_by(id: order_id).update(status: status)
    OrderItem.where(order_id: order_id).update_all(status: status)
    flash[:info] = "Orders marked as #{status}"
    redirect_to admin_orders_path
  end
end
