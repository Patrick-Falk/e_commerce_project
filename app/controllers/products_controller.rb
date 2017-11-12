class ProductsController < ApplicationController

  helper_method :sort_column, :sort_direction
  def index
    # @categories = Product.categories
    @products = Product.search(params[:search])
                       .order(sort_column + " " + sort_direction)
                       .page(params[:page]).per(5)
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
