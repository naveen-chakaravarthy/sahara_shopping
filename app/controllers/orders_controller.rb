class OrdersController < ApplicationController
  def index
    render 'index', locals: { orders: @user.order.all }
  end

  def admin_orders
    render "admin_orders", locals: { orders: Order.all }
  end

  def set_status
    order_id = params[:id]
    status = params[:status]
    Order.find_by(id: order_id).update(status: status)
    OrderItem.where(order_id: order_id).update_all(status: status)
    flash[:info] = "Orders marked as #{status}"
    redirect_to admin_orders_path
  end
end
