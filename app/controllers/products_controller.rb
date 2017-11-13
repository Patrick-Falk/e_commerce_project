class ProductsController < ApplicationController

  helper_method :sort_column, :sort_direction
  def index
    # @categories = Product.categories
    @categories = Category.all
    @products = Product.filter(params[:asdf])
                       .search(params[:search])
                       .order(sort_column + " " + sort_direction)
                       .page(params[:page]).per(5)
  end

  def category
    @categories = Category.all
    @products = Product.where(category_id: params[:id])
                       .search(params[:search])
                       .order(sort_column + " " + sort_direction)
                       .page(params[:page]).per(5)
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def filter_category
    Product.category.find
  end

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
