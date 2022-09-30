class AddCountToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :count, :integer, default: 1
  end
end
