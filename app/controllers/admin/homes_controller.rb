class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  layout "admin_application"

  def top
    @orders = Order.all.page(params[:page]).per(10)
  end
end
