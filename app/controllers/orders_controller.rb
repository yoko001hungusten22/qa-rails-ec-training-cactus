class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
  end

  def destroy
    @order = Order.find_by(id: params[:id]).destroy!
    #TODO: 注文履歴ページが実装されたら以下の遷移先を変更すること
    redirect_to order_path
  end
end
