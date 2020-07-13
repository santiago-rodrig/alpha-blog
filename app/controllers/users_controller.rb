class UsersController < ApplicationController
  before_action :set_user, only: [:update, :edit, :show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Welcome to the Alpha Blog, you have successfully signed up.'
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
  end

  def show
    @articles = @user.articles.order('created_at DESC')
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Account details successfully updated.'
      redirect_to articles_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
