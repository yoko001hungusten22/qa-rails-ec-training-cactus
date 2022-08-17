class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:show, :edit, :update]
  include SessionsHelper
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザーを登録しました。こちらからログインしてください。'
      redirect_to login_path
    else
      flash.now[:danger] = '登録に失敗しました'
      render "new"
    end
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
