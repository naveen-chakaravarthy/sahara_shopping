class AdminController < ApplicationController
  def list_categories
    render "list_categories"
  end

  def list_items
    render "list_items"
  end

  def create_category
    if request.get?
      render "create_category"
    else
      category = MenuCategory.create!(
        name: params[:name],
        )

      flash[:info] = "Category Created Successful - #{category.name}."
      redirect_to list_categories_path
    end
  end

  def create_item
    if request.get?
      render "create_item"
    else
      item = MenuItem.create!(
        menu_category_id: params[:menu_category_id],
        name: params[:name],
        description: params[:description],
        price: params[:price],
        )

      flash[:info] = "Menu Item Created Successful - #{item.name}."
      redirect_to list_items_path
    end
  end

end