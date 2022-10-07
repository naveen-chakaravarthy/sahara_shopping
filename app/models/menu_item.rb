class MenuItem < ApplicationRecord
  belongs_to :menu_category
  has_one_attached :image_path

  def self.has_attachment(item)
    item.image_path.attached?
  end
end