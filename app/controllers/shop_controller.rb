class ShopController < ApplicationController
  def index
    if @user.user_type == "owner"
      redirect_to admin_orders_path
    else
      render "index"
    end
  end

  def admin_shop
      render "index"
  end

  def add_to_cart
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

  def remove_from_cart
    cart_item_id = params[:item_id]
    cart_item = CartItem.find_by(id: cart_item_id)
    if cart_item and cart_item.count > 1
      cart_item.update(count: cart_item.count - 1)
    elsif cart_item.count == 1
      cart_item.destroy
    end
    redirect_to shop_index_path
  end
end
