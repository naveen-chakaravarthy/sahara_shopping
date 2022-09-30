class CartItem < ApplicationRecord
  belongs_to :menu_item
  belongs_to :user

  def self.current_user_cart_items(current_user_id)
    user = User.find_by(id: current_user_id)
    user.cart_item.all
  end

  def self.get_current_user_cart_total(current_user_id)
    items = current_user_cart_items(current_user_id)
    total_price = 0
    items.all.each do |item|
      total_price += item.menu_item_price * item.count
    end
    total_price
  end
end