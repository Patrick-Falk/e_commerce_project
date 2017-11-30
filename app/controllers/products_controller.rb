class ProductsController < ApplicationController
  # has_scope :category
  before_action :initialize_session
  before_action :increment_visit_count, only: [:index]
  before_action :load_shopping_cart, only: [:index]

  helper_method :sort_column, :sort_direction
  def index
    # @categories = Product.categories
    @categories = Category.all
    @products = Product.filter(params[:product])
                       .search(params[:search])
                       .order(sort_column + " " + sort_direction)
                       .page(params[:page]).per(5)
  end

  def table
    # @categories = Product.categories
    @categories = Category.all
    @products = Product.filter(params[:product])
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

  def add_to_cart
    id = params[:id].to_i
    # debugging
    # render plain: "Remembering to call product with id #{id}"
    session[:shopping_cart] << id unless session[:shopping_cart].include?(id)

    # still need to render something
    redirect_to root_url
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    redirect_to root_url
  end

  def remove_all_from_cart
    session[:shopping_cart] = []
    redirect_to root_url
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

  def initialize_session
    session[:visit_count] ||= 0
    session[:shopping_cart] ||= []
  end

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

  def load_shopping_cart
    @shopping_cart = Product.find(session[:shopping_cart])
  end
end
