class UsersController < ApplicationController
  before_action :set_user, only: [:update, :edit, :show, :destroy]
  before_action :ensure_logged_in, except: [:new, :create, :index, :show]
  before_action :ensure_same_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Welcome to the Alpha Blog, you have successfully signed up.'
      session[:user_id] = @user.id
      redirect_to @user
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
    session[:user_id] = nil if current_user == @user
    @user.destroy
    flash[:info] = msg
    redirect_to users_path
  end

  def show
    @articles = @user.articles.order('created_at DESC')
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Account details successfully updated.'
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def ensure_same_user
    unless current_user == @user || current_user.admin?
      flash[:danger] = 'That account is not yours.'
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
