class UsersController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = present(User.find(params[:id]))
  end

  def destroy
    User.find(params[:id]).toggle!(:deleted)
    redirect_to users_path
  end

  def update
    User.find(params[:id]).update_attributes(params.require(:user).permit!)
    redirect_to users_path
  end
end
