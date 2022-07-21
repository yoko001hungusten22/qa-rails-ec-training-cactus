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
      flash[:danger] = '他人の情報にアクセスすることはできません。'
      redirect_to root_path
    end
  end
end
