class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  include SessionsHelper
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update!(user_params)
      flash[:success] = '更新に成功しました'
      redirect_to @user
    else
      flash.now[:danger] = '更新に失敗しました'
      render "edit"
    end
  end

  def destroy
    User.find_by(id: params[:id]).destroy!
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :zipcode, :prefecture, :municipality, :address, :apartments, :email, :phone_number, :company_name, :password, :password_confirmation)
  end

  def correct_user
    user = User.find_by(id: params[:id])
    if current_user != user
      flash[:danger] = '他人の情報にアクセスすることはできません。'
      redirect_to root_path
    end
  end

end
