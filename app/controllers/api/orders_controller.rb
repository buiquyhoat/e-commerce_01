class Api::OrdersController < ApplicationController
  def show
    @order = Order.find_by id: params[:id]
    if @order.present?
      respond_to do |format|
        format.html {
          render partial: "order_details",
            locals: {
              order:  @order,
              order_details: @order.order_details
            }
        }
      end
    end
  end
end
