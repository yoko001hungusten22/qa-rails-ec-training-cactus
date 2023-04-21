class CartItemsController < ApplicationController
	def update_item
    cart_item = CartItem.find(params[:id])
    begin
      raise StandardError, "個数を整数で入力してください" if params[:quantity].to_i.zero?
      cart_item.update(quantity: params[:quantity])
      flash[:success] = '商品の個数が更新されました。'
    rescue Exception => error
      flash[:danger] = error
    end
    redirect_to cart_path(cart_item.cart)
  end
end
