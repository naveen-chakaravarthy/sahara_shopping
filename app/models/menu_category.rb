class MenuCategory < ApplicationRecord
  has_many :menu_item

  def self.get_all_categories
    MenuCategory.all.map { |x| [x.name, x.id] }
  end
end