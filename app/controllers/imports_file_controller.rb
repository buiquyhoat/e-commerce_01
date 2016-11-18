class ImportsFileController < ApplicationController
  def import
    Product.import(params[:file])
    redirect_to admin_products_path
  end
end
