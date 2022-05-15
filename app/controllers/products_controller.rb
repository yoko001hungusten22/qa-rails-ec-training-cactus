class ProductsController < ApplicationController
  def show
    @product = Product.find_by(id: params[:id])
  end

  def index
    @products = Product.all.page(params[:page]).per(10)
  
    if params[:product_name].present?
      @products = @products.get_by_name params[:product_name]
    end
    if params[:category].present?
      @products = @products.get_by_category params[:category]
    end
  end
end
