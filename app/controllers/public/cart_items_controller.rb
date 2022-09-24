class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  layout "public_application"

  def index
    @cart_items = CartItem.all
  end

  def create
    #current_customerが持っているカートの中に追加しようとしている商品があるか
    @cart_item = CartItem.new(cart_item_params)
    if present_item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
      #存在しているものを渡すための変数です
      new_amount = params[:cart_item][:amount].to_i + present_item.amount
      #上記で探した数量にストロングパラメータで送られてきたものを加算する
      present_item.update(amount: new_amount)
      redirect_to cart_items_path
    else
    #カートの中に商品がなかった場合
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.save!
      redirect_to cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end

end

