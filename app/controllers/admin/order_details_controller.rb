class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  
  layout "admin_application"

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)
    if @order_details.where(making_status: "in_making").count >= 1
      @order.status = "in_making"
      @order.save
    end

    if @order.order_details.count == @order_details.where(making_status: "complete_making").count
      @order.status = "yet_sent"
      @order.save
    end
    redirect_to admin_order_path(@order.id)
  end

    private

    def order_detail_params
      params.require(:order_detail).permit(:making_status)
    end
end

