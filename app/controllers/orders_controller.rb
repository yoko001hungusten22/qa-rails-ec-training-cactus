class OrdersController < ApplicationController
  before_action :logged_in_user, only: [:show, :index]
  before_action :correct_user, only: [:show]
  include SessionsHelper

  def show
    @order = current_user.orders.find_by(id: params[:id])
  end

  def destroy
    @order = Order.find_by(id: params[:id]).destroy!
    #TODO: 注文履歴ページが実装されたら以下の遷移先を変更すること
    redirect_to order_path
  end
  
  def index
    @orders = current_user.orders.page(params[:page]).per(10)
  end

  def correct_user
    order = Order.find_by(id: params[:id])
    if current_user != order.user
      #TODO: トップページが実装されたらこの部分をroot_pathに変更すること
      flash[:danger] = '他人の情報にアクセスすることはできません。'
      redirect_to login_url
    end
  end
end
