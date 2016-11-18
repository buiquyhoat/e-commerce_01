class Admin::StatisticPieController < ApplicationController
  def index
    product = Product.hot_trends
    respond_to do |format|
      format.json {
        render json: [
          {name: t(".brands"),
          colorByPoint: true,
          data: product}
        ]
      }
    end
  end
end
