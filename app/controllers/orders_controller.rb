class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
  end

  def index
    @orders = Order.order('id').page(params[:page]).per(10)
  end
end