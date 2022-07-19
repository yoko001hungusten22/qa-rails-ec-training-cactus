class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
  end

  def destroy
    @order = Order.find_by(id: params[:id]).destroy!
    redirect_to order_path
  end
end
