class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    flash[:notice] = "You have created address successfully."
    redirect_to addresses_path
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path
    flash[:notice] = "You have updated address successfully."
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
    flash[:notice] = "Address was successfully destroyed"
  end

  protected

  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end

end
