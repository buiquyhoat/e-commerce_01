class SuggestProductsController < ApplicationController
  before_action :verify_user
  before_action :load_suggest, except: [:new, :create]

  def new
    @suggest_product = SuggestProduct.new
  end

  def create
    @suggest_product = SuggestProduct.new suggest_params
    @suggest_product.user =  current_user
    if @suggest_product.save
      flash[:success] = t ".suggest_create_suggest"
      redirect_to @suggest_product
    else
      render :new
    end
  end

  def show
  end

  private
  def load_suggest
    @suggest_product = SuggestProduct.find_by id: params[:id]
    unless @suggest_product
      flash.now[:warning] = t ".suggest_not_found"
      render_404
    end
  end

  def suggest_params
    params.require(:suggest_product).permit :product_name, :product_description
  end
end
