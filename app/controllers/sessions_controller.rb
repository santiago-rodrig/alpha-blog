class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: login_params[:email])
    if user&.authenticate(login_params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'You have successfully logged in.'
      redirect_to user
    else
      flash[:notice] = 'Wrong credentials.'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You have successfully logged out.'
    redirect_to root_path
  end

  private

  def login_params
    params.require(:credentials).permit(:email, :password)
  end
end
