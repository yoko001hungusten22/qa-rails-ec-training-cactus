class OrdersController < ApplicationController
  before_action :logged_in_user, only: [:show, :index]
  include SessionsHelper

  def create
    order_number = SecureRandom.hex(2)
    @order = Order.create(user_id: current_user.id, order_number: order_number)
      current_user.cart.cart_items.each do |cart_item|
        order_detail = OrderDetail.new(order_id: @order.id)
        order_detail.order_detail_number = @order.id
        order_detail.product_id = cart_item.product.id
        order_detail.order_quantity = cart_item.quantity
        sub_total_price = cart_item.sum_of_price
        order_detail.shipment_status_id = 1
        order_detail.save!
      end
    current_user.cart.destroy!
    redirect_to orders_purchase_completed_path(order_id: @order)
  end

  def purchase_completed
    @order = Order.find_by(id: params[:order_id])
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
  end

  def destroy
    @order = current_user.orders.find_by(id: params[:id])
    if @order.find_preparation_shipment_status
      @order.destroy!
    end
    redirect_to orders_path
  end

  def index
    @orders = current_user.orders.page(params[:page]).per(10)
  end

  def correct_user
    order = Order.find_by(id: params[:id])
    if current_user != order.user
      flash[:danger] = '他人の情報にアクセスすることはできません。'
      redirect_to root_path
    end
  end
end
