class OrdersController < ApplicationController
  def show
    @orders = Order.find_by(id: params[:id])
    @order_detail = OrderDetail.find_by(id: params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end
end