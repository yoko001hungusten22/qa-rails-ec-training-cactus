class OrdersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :correct_user, only: [:show]
  include SessionsHelper

  def show
    @order = current_user.orders.find_by(id: params[:id])
  end

  def correct_user
    order = Order.find_by(id: params[:id])
    if current_user != order.user
      #TODO: トップページが実装されたらこの部分をroot_pathに変更すること
      flash[:danger] = '他人の情報にアクセスすることはできません。'
      redirect_to login_url
    end
  end

  def index
    @orders = current_user.orders.order('id').page(params[:page]).per(10)
  end
end