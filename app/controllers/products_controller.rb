class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def index
    @newest_products = Product.newest
    @best_sellers = Product.best_seller
    @recent_views = Product.recent_views load_cookie_recent_product
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
