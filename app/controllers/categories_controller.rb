class CategoriesController < ApplicationController
  before_action :set_category, only: :show

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
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = Category.new
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end

