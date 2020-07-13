class UsersController < ApplicationController
  before_action :set_user, only: [:update, :edit, :show, :destroy]
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

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def edit
  end

  def destroy
    msg = "The user #{@user.name} and all its articles have been deleted."
    @user.destroy
    flash[:notice] = msg
    redirect_to users_path
  end

  def show
    @articles = @user.articles.order('created_at DESC')
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Account details successfully updated.'
      redirect_to @user
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
