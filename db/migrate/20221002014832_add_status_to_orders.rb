class AddStatusToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :status, "enum('delivered', 'cancelled', 'pending')", :default => :pending
  end
end
