class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @search = User.search(params[:q])
    @users = @search.result.page(params[:page]).per(10)
  end
end
