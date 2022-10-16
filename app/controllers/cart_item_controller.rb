class CartItemController < ApplicationController

  def create
    menu_item_id = params[:item_id]
    menu_item = MenuItem.find_by(id: menu_item_id)
    cart_item = CartItem.find_by(user_id: session[:current_user_id], menu_item_id: menu_item_id)
    if cart_item
      cart_item.update(count: cart_item.count + 1)
    else
      CartItem.create!(user_id: session[:current_user_id], menu_item_id: menu_item_id, menu_item_name: menu_item.name,
                       menu_item_price: menu_item.price, )
    end

    redirect_to shop_index_path
  end

  def destroy
    cart_item_id = params[:id]
    cart_item = CartItem.find_by(id: cart_item_id)
    if cart_item and cart_item.count > 1
      cart_item.update(count: cart_item.count - 1)
    elsif cart_item.count == 1
      cart_item.destroy
    end
    redirect_to shop_index_path
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
    redirect_to orders_path
  end
end

