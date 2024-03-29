class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
    user.password =  SecureRandom.urlsafe_base64(6)
    user.last_name =  "ゲスト"
    user.first_name = "ユーザー"
    user.zipcode = "1234567"
    user.prefecture = "北海道"
    user.municipality = "札幌市"
    user.address = "1-23-4"
    user.phone_number = "080123456789"
    user.company_name = "株式会社ゲスト"
    user.user_classification_id = 1
    end
    log_in(user)
    flash[:success] = 'ゲストユーザーとしてログインしました。'
    redirect_to root_path
  end
end
