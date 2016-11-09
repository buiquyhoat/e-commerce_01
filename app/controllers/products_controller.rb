class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def index
    @newest_products = Product.newest
    @best_sellers = Product.best_seller
  end

  def show
    @sizes =  @product.sizes
    @colors = @product.colors
  end

  private
  def load_product
  @product = Product.find_by id: params[:id]
  unless @product
    flash.now[:warning] = t "product.not_found"
    redirect_to render_404
  end
 end
end
