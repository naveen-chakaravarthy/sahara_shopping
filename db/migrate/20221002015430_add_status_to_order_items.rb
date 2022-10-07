class AddStatusToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :status, "enum('delivered', 'cancelled', 'pending')", :default => :pending
  end
end
