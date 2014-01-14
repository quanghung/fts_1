class Admin::UsersController < ApplicationController
  before_action :signed_in_admin

  def index
    @users = User.all.paginate page: params[:page]
  end
  
  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = I18n.t ".messages.add_user.success"
      redirect_to admin_users_path
    else
      flash[:success] = I18n.t ".messages.add_user.unsuccess"
      render "new"
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes! user_params
      flash[:success] = I18n.t ".messages.update.success"
      redirect_to admin_user_path @user
    else
      flash[:success] = I18n.t ".messages.update.unsuccess"
      redirect_to "edit"
    end
  end

  def destroy
    user = User.find params[:id]
    user.not_validates_password = true
    if user.destroy!
      flash[:success] = I18n.t ".messages.delete_user.success"
    else
      flash[:success] = I18n.t ".messages.delete_user.unsuccess"
    end
    redirect_to admin_users_path
  end

  private
    def user_params
      params.require(:user).permit :name, :password,:password_confirmation, :email
    end
end