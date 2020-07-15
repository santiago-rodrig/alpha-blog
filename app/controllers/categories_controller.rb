class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin, except: [:index, :show]

  def show
    @articles = @category.articles.paginate(page: params[:page], per_page: 10)
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

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'Category updated successfully.'
      redirect_to @category
    else
      render :edit
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

  def ensure_admin
    unless current_user&.admin?
      flash[:danger] = 'Only admins allowed.'
      redirect_to categories_url
    end
  end
end

