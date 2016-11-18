class Admin::StatisticController < ApplicationController
  def index
     @orders = []
     @customer_accounts = []
     order_count
     customer_count

    respond_to do |format|
      format.json {
        render json: [
          {type: t(".column"), name: t(".customer_account"),
            data: @customer_accounts,yAxis: Settings.number_one,
            tooltip: {valueSuffix: " mems"}},
          {type: t(".spline"), name: t(".order_count"), data: @orders,
            tooltip: {valueSuffix: " orders"}}
        ]
      }
    end
  end

  private
  def order_count
    current_date = Time.now
    Settings.number_seven.times.each do |day|
      @orders << Order.order_count(current_date.strftime(Settings.format_date))
      current_date = (current_date - Settings.number_one.day)
    end
  end

  def customer_count
    current_date = Time.now
    Settings.number_seven.times.each do |day|
      @customer_accounts << User.customer_count(current_date.strftime(Settings.format_date))
      current_date = (current_date - Settings.number_one.day)
    end
  end
end
