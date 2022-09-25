class Public::HomesController < ApplicationController
  #before_action :authenticate_customer!

  layout "public_application"

  def top
    @genres = Genre.all
    @items = Item.all.order(id: "DESC")
  end

  def about
  end
end
