class MenuItemController < ApplicationController
  before_action :fetch_all_categories, :fetch_menu_item, only: [:edit, :new, :update]

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
  end

  def update
    item = @menu_item
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
    item = @menu_item
    item.destroy
    flash[:error] = "Menu Item deleted - #{item.name}."
    redirect_to list_items_menu_category_index_path
  end

  private

  def fetch_menu_item
    @menu_item = MenuItem.find_by(id: params[:id])
  end

  def fetch_all_categories
    @all_categories = MenuCategory.get_all_categories
  end
end