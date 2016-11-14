class OrdersController < ApplicationController
  before_action :verify_user, :load_user, :load_session_cart

  def new
    @order = @user.orders.build
    @product_quantity = @session_cart.map {|id, quantity|
      [Product.find_by(id: id), quantity]}
    each_amout = []
    if @product_quantity
      @product_quantity.each do |product, quantity|
        each_amout << product.price.to_i * quantity.to_i
      end
    end
    @total_amout = each_amout.reduce(0) {|total_amout, price| total_amout += price}
  end

  def create
    @order = @user.orders.build order_params
    if @order.save
      @session_cart.keys.each do |item|
        quantity = @session_cart[item].to_i
        @order_detail = @order.order_details.build
        @product_in_order = Product.find_by id: item.to_i
        @order_detail.update quantity:  quantity,
          product_id: item.to_i, product_uuid: @product_in_order.uuid,
          product_name: @product_in_order.product_name
        @order_detail.save
      end
      @session_cart.clear
      flash[:success] = t ".orders_create_successfully"
    else
      flash[:danger] = t ".orders_create_failed"
    end
    redirect_to root_url
  end

  private
  def order_params
    params.require(:order).permit :message, :shipping_name, :shipping_email,
      :shipping_address
  end

  def load_user
    @user = current_user
    render_404 unless @user
  end

  def load_session_cart
    @session_cart = session[:cart]
    redirect_to root_url if @session_cart.blank?
  end
end
