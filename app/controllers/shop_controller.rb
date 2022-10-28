class ShopController < ApplicationController
  def index
    render 'index', locals: {
      current_user_cart_item: CartItem.current_user_cart_items(@user.id),
      current_user_cart_total: CartItem.get_current_user_cart_total(@user.id),
      menu_items: MenuItem.all.each
    }
  end
end
