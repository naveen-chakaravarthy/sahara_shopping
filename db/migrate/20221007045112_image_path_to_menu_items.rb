class ImagePathToMenuItems < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_items, :image_path, :string
  end
end
