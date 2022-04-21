class ProductsController < ApplicationController
  def show
    @products = Product.find_by(id: params[:id])
    @categories = Category.find_by(id: params[:id])
  end
end
