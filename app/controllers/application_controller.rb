class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    the_id = session[:user_id]

    if the_id
      @current_user ||= User.find_by_id(the_id)
      session.delete(:user_id) unless @current_user
    end

    @current_user
  end

  def ensure_logged_in
    unless current_user
      flash[:notice] = 'You are not logged in.'
      redirect_to root_path
    end
  end
end
