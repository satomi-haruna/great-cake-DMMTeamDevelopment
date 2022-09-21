class Public::CustomersController < ApplicationController
  
  def show
  end


  private

    def set_customer
      @customer = Customer.find([:id])
    end

end
