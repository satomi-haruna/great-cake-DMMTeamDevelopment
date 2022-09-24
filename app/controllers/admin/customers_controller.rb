class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  # layoutsのadmin_applicationを読み込む
  layout "admin_application"

  def index
    @customer = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "編集成功しました"
      redirect_to admin_customer_path(@customer.id)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:email,:telephone_number,:post_code,:address,:is_deleted)
  end

end
