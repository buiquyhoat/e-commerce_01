 class Supports::ProductSupport
  include ProductsHelper

  def initialize load_cookie_recent_product, params
    @load_cookie_recent_product = load_cookie_recent_product
    @params = params
  end

  def search
    Product.paginate(page: @params[:page],
      per_page: Settings.products_per_page).search(@params[:product_name],
      @params[:category], @params[:min_price], @params[:max_price],
      @params[:min_quantity], @params[:max_quantity])
  end

  def newest_products
    Product.newest
  end

  def best_sellers
    Product.best_seller
  end

  def recent_views
    Product.recent_views @load_cookie_recent_product
  end

end
