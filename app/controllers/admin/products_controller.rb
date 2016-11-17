class Admin::ProductsController < ApplicationController
  layout "admin"
  before_action :require_admin
  before_action :load_product, except: [:new, :create, :index]
  before_action :load_categories, only: [:new, :create, :edit, :update]

  def index
    @search = Product.paginate(page: params[:page],
      per_page: Settings.products_admin_per_page).search(params[:product_name],
      params[:category], params[:min_price], params[:max_price],
      params[:min_quantity], params[:max_quantity])
    @categories = Category.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t ".create_success"
      redirect_to admin_products_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t ".update_success"
      redirect_to admin_products_url
    else
      render :edit
    end
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

  private
  def product_params
    params.require(:product).permit :product_name, :description, :image, :price,
      :rating, :quantity, :category_id,
      colors_attributes: [:id, :color_name, :_destroy],
      sizes_attributes: [:id, :size_name, :_destroy]
  end

  def load_product
    @product = Product.find_by id: params[:id]
    unless @product
      flash.now[:warning] = t "product.not_found"
      render_404
    end
  end

  def load_categories
    @category = Category.all
  end
end
