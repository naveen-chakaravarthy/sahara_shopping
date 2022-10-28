class MenuCategoryController < ApplicationController
  before_action :fetch_menu_category

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
    render 'edit', locals: {category: @menu_category}
  end

  def update
    category = @menu_category.update(name: params[:name])

    flash[:info] = "Category Updated Successful - #{category}."
    redirect_to menu_category_index_path
  end

  def destroy
    category = @menu_category
    category.destroy
    flash[:error] = "Menu Category deleted - #{category.name}."
    redirect_to menu_category_index_path
  end

  private

  def fetch_menu_category
    @menu_category = MenuCategory.find_by(id: params[:id])
  end
end