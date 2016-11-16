class Admin::ProductsController < ApplicationController
  layout "admin"

  def index
    @search = Product.paginate(page: params[:page],
      per_page: Settings.products_admin_per_page).search(params[:product_name],
      params[:category], params[:min_price], params[:max_price],
      params[:min_quantity], params[:max_quantity])
    @categories = Category.all
  end

  def destroy
    @product = Product.find_by id: params[:id]
    if @product && @product.destroy
      flash[:success] = t ".destroy_success",
        objects: t("activerecord.model.product")
    else
      flash[:danger] = t ".destroy_error",
        objects: t("activerecord.model.product")
    end
    redirect_to admin_products_url
  end
end
