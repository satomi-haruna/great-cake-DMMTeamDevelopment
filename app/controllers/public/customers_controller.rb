class Public::CustomersController < ApplicationController

  protect_from_forgery
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    # p current_customer
    # p '目印です表示されてほしい'
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to about_path
  end


  private

    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :is_deleted)
    end

    def set_customer
      @customer = Customer.find(params[:id])
      redirect_to customers_my_page_path
    end

end
