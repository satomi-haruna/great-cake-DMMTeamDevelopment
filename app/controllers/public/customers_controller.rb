class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
    unless @customer == current_customer
      redirect_to about_path
    end
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render :edit
    end
  end


  private

    def set_customer
      @customer = Customer.find([:id])
      redirect_to customers_my_page_path
    end

end
