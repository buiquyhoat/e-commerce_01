class Admin::OrdersController < ApplicationController
  layout "admin"
  before_action :load_order, except: [:index]
  before_action :require_admin

  def index
    @search_orders =  Order.search(params[:shipping_name])
      .paginate(page: params[:page], per_page: Settings.categories_per_page)
    @orders = Order.all.order("created_at")
  end

  def edit
  end

  def update
    if @order.update_attributes order_params
      flash[:success] = t ".order_updated"
      redirect_to admin_orders_path
    else
      flash.now[:danger] = t ".update_failed"
      render :edit
    end
  end

  private
  def order_params
    params.require(:order).permit :status
  end

  def load_order
    @order = Order.find_by id: params[:id]
    render_404 unless @order
  end
end
