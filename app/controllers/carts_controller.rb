class CartsController < ApplicationController
  include SessionsHelper

  def show
    @cart = Cart.find_by(user: current_user)
  end

  def add_item
    cart = Cart.find_by(user: current_user)
    begin
      raise StandardError, "個数を整数で入力してください" if params[:quantity].to_i.zero?
      if cart.present?
        cart_item = cart.cart_items.find_by(product_id: params[:product_id])
        if cart_item.present?
          cart_item.quantity += params[:quantity].to_i
          if cart_item.save
            flash[:success] = '商品の個数が更新されました。'
            redirect_to cart
          else
            flash.now[:danger] = @cart.errors.full_messages
            render "products/show"
          end
        else
          cart_item = cart.cart_items.new(product_id: params[:product_id], quantity: params[:quantity])
          if cart_item.save
            flash[:success] = 'カートに商品が追加されました。'
            redirect_to cart
          else
            flash.now[:danger] = @cart.errors.full_messages
            render "products/show"
          end
        end
      else
        @cart = Cart.new(user: current_user)
        @cart.cart_items.new(product_id: params[:product_id], quantity: params[:quantity])
        if @cart.save
          flash[:success] = 'カートに商品が追加されました。'
          redirect_to @cart
        else
          flash.now[:danger] = @cart.errors.full_messages
          render "products/show"
        end
      end
    rescue Exception => error
      flash.now[:danger] = error
      render "products/show"
    end
  end

  def delete_item
    @cart = Cart.find_by(user: current_user)
    @cart.cart_items.find_by(params[:id]).destroy!
    redirect_to @cart
    flash[:success] = 'カート内アイテムを削除しました'
  end
end