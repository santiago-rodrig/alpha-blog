class CategoriesController < ApplicationController
  def show
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:success] = 'Category created successfully.'
      redirect_to @category
    else
      render :new
    end
  end

  def index
  end

  def new
    @category = Category.new
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
