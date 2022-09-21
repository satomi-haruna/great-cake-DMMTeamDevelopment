class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
  end

  def update
  end


  private

    def set_customer
      @customer = Customer.find([:id])
    end

end
