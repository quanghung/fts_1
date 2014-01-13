class UsersController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, only: [:edit, :update]

  def show

  end

  def edit
  end

  def update
    
  end

  private

    # Before filters

    def correct_user
      @user = User.find params[:id]
      redirect_to(root_url) unless current_user?(@user)
    end
end
