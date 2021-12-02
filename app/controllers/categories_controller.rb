class CategoriesController < ApplicationController
  def index
  end

  def show
    user = current_user
    @category =user.categories.find(params[:id])
  end

  def creation
    @category = Category.new
  end

  def create
    @category = Category.new
    user = current_user
    @category.user_id = user.id
    temp = params[:category]
    name = temp[:name]
    icon = temp[:icon]
    @category.name = name
    @category.icon = icon

    if @category.save
      redirect_to("/categories/")
    else
      flash.alert = "Image or name are invalid"
      redirect_to("/categories/create")
    end

  end

  def destroy
  end
end
