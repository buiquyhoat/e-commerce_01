class CategoriesController < ApplicationController
  before_action :load_category, only: :show

  def show
    @products = @category.products.newest.paginate(page: params[:page],
      per_page: Settings.products_per_page)
  end
end
