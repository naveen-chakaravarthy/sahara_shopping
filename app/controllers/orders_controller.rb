class OrdersController < ApplicationController
  def my_orders
    render "my_orders"
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
end
