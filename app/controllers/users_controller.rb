class UsersController < ApplicationController
  before_action :set_user,only: [:edit, :update]
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = 'プロフィールを更新しました'
      redirect_to @user
    else
      @users = User.all
      flash.now[:alert] = 'プロフィールの更新に失敗しました'
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:age,:area)
  end
  
  def set_user
    @user = User.find(current_user)
  end
end
