class ProductsController < ApplicationController
  include ProductsHelper
  before_action :load_product, only: :show

  def index
    @categories = Category.all
    @product_support = Supports::ProductSupport.new load_cookie_recent_product, params
  end

  def show
    save_cookie_recent_product @product
    @sizes =  @product.sizes
    @colors = @product.colors
  end

  private
  def load_product
  @product = Product.find_by id: params[:id]
  unless @product
    flash.now[:warning] = t "product.not_found"
    render_404
  end
 end
end
