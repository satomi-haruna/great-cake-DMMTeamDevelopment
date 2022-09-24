class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!

  layout "public_application"

  def index
    @items = Item.all.page(params[:page]).per(10)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

end
