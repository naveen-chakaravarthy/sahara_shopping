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
      item.image_path.attach(params[:image_path])
      flash[:info] = "Menu Item Created Successful - #{item.name}."
      redirect_to list_items_path
    end
  end

  def delete_item
    item_id = params[:item]
    item = MenuItem.find_by(id: item_id)
    item.destroy
    flash[:error] = "Menu Item deleted - #{item.name}."
    redirect_to list_items_path
  end

  def delete_category
    category_id = params[:category]
    category = MenuCategory.find_by(id: category_id)
    category.destroy
    flash[:error] = "Menu Category deleted - #{category.name}."
    redirect_to list_categories_path
  end

end