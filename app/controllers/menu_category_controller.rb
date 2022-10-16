class MenuCategoryController < ApplicationController

  def index
  end

  def new
  end

  def create
    category = MenuCategory.create!(
      name: params[:name],
      )

    flash[:info] = "Category Created Successful - #{category.name}."
    redirect_to menu_category_index_path
  end

  def destroy
    category_id = params[:id]
    category = MenuCategory.find_by(id: category_id)
    category.destroy
    flash[:error] = "Menu Category deleted - #{category.name}."
    redirect_to menu_category_index_path
  end

end