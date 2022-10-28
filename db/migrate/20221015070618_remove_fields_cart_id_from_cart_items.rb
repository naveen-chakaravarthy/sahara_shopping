class RemoveFieldsCartIdFromCartItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :cart_items, :cart_id, :int
  end
end
