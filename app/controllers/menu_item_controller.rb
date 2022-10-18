class MenuItemController < ApplicationController

  def index
    menu_items = MenuItem.all.map
  end

  def new
  end

  def list_items
    render "list_items", locals: {menu_items: MenuItem.all.map}
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
    redirect_to list_items_menu_category_index_path
  end

  def edit
    render 'edit', locals: {item: MenuItem.find_by(id: params[:id])}
  end

  def update
    item = MenuItem.find_by(id: params[:id])
    item.update(
      name: params[:name],
      description: params[:description],
      price: params[:price]
    )
    item.image_path.attach(params[:image_path]) if params[:image_path]
    flash[:info] = "Item Updated Successfully"
    redirect_to list_items_menu_category_index_path
  end

  def destroy
    item_id = params[:id]
    item = MenuItem.find_by(id: item_id)
    item.destroy
    flash[:error] = "Menu Item deleted - #{item.name}."
    redirect_to list_items_menu_category_index_path
  end

end