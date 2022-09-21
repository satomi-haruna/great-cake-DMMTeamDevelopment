class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @address = Address.find(params[:order][:address_id])
    @order.post_code = @address.post_code
    @order.address = @address.address
    @order.name = @address.name
    @cart_items = current_customer.cart_items
    @postage = 800
    @total = 0
    @total_payment = 0
    #binding.pry #デバッグ用（後で消去）
  end

  def complete
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.postage = 800
    @order.status = 0
    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.price = cart_item.item.price
        order_detail.save
      end
    end
    redirect_to orders_complete_path
    cart_items.destroy_all
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
