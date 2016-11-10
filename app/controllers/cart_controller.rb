class CartController < ApplicationController
  def index
    @cart = session[:cart] ? session[:cart] : {}
    @product_quantity = @cart.map {|id, quantity|
      [Product.find_by(id: id), quantity]}
  end

  def create
    id = params[:id]
    session[:cart] = {} unless session[:cart]
    cart = session[:cart]
    cart[id] = cart[id] ? (cart[id] + 1) : 1
    redirect_to cart_index_path
  end

  def update
    session[:cart][params[:id]] = params[:quantity]
    redirect_to cart_path
  end

  def destroy
   session[:cart][params[:id]] = nil
   redirect_to action: :index
  end
end
