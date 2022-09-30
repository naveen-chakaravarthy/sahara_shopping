class AddCountToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :count, :integer, default: 1
  end
end
