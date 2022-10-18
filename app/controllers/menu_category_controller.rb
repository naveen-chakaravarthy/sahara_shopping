class MenuCategoryController < ApplicationController

  def index
    render 'index' , locals: { menu_category: MenuCategory.all }
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

  def edit
    render 'edit', locals: {category: MenuCategory.find_by(id: params[:id])}
  end

  def update
    category = MenuCategory.find_by(id: params[:id]).update(name: params[:name])

    flash[:info] = "Category Updated Successful - #{category}."
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