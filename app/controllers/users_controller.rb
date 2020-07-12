class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    render html: 'It works'
  end
end
