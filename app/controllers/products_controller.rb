class ProductsController < ApplicationController

  helper_method :sort_column, :sort_direction
  def index
    # @products = Product.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    @products = Product.search(params[:search]).order(sort_column + " " + sort_direction)
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
