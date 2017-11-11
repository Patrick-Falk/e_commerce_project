class ProductsController < ApplicationController
  def index
    @products = Product.order(params[:sort])
  end

  def show
    @product = Product.find(params[:id])
  end
end
