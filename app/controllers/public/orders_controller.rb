class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  layout "public_application"

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @postage = 800
    @total = 0
    @total_payment = 0
    @order.payment_method = params[:order][:payment_method]

    if params[:select_address] == "0"
     @order.post_code = current_customer.post_code
     @order.address = current_customer.address
     @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:select_address] == "1"
     @address = Address.find(params[:address_id])
     @order.post_code = @address.post_code
     @order.address = @address.address
     @order.name = @address.name

    elsif params[:select_address] == "2"
     @order.post_code = params[:order][:post_code]
     @order.address = params[:order][:address]
     @order.name = params[:order][:name]
    end
  end

  def complete
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    @order.status = 0
    if @order.save!
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.amount
        order_detail.price = cart.item.price
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
