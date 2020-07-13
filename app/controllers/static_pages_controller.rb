class StaticPagesController < ApplicationController
  def home
    redirect_to articles_path if current_user
  end

  def about
  end
end
