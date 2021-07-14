class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

#会員マイページ
  def show
    @customer = Customer.find(params[:id])
  end

#会員情報の編集
  def edit
    @customer = Customer.find(params[:id])
  end

 #編集内容の更新
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to my_page_path, notice: '会員情報の更新が完了しました。'
    else
      render "edit"
    end

  end

  private
   def customer_params
      params.require(:customer).permit(:name, :email, :postal_code, :address, :telephone_number)
   end

end
