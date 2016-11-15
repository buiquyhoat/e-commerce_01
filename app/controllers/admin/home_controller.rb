class Admin::HomeController < ApplicationController
  before_action :require_admin
  layout "admin"

  def index
  end
end
