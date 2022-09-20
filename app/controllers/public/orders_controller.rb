class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.post_code = @address.post_code
    @order.address = @address.address
    @order.name = @address.name
    #binding.pry #デバッグ用（後で消去）
  end

  def complete
  end

  def create
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_subtotal = 0
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name, :postage, :status, :total_payment)
  end


end
