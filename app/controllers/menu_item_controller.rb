class MenuItemController < ApplicationController

  def index
  end

  def new
  end

  def list_items
    render "list_items"
  end

  def create
    item = MenuItem.create!(
      menu_category_id: params[:menu_category_id],
      name: params[:name],
      description: params[:description],
      price: params[:price],
      )
    item.image_path.attach(params[:image_path])
    flash[:info] = "Menu Item Created Successful - #{item.name}."
    redirect_to menu_category_index_path
  end

  def desetroy
    item_id = params[:item]
    item = MenuItem.find_by(id: item_id)
    item.destroy
    flash[:error] = "Menu Item deleted - #{item.name}."
    redirect_to menu_category_index_path
  end

end