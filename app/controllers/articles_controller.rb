class ArticlesController < ApplicationController
  ACTION_PREFIX = 'Article was successfully '

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :ensure_logged_in, except: [:index, :show]
  before_action :ensure_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 10)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "#{ACTION_PREFIX}created"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "#{ACTION_PREFIX}updated"
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:info] = "#{ACTION_PREFIX}deleted"
    redirect_to articles_url
  end

  private

  def ensure_same_user
    unless current_user == @article.user || current_user.admin?
      flash[:danger] = 'You are not the owner of this article.'
      redirect_to root_path
    end
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end

