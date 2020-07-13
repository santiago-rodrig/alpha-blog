class ApplicationController < ActionController::Base
  def current_user
    if session[:user_id]
      user = User.find_by(id: session[:user_id])

      if user
        return user
      end
    end

    nil
  end

  private

  def ensure_logged_in
    unless current_user
      flash[:notice] = 'You are not logged in.'
      redirect_to root_path
    end
  end
end
