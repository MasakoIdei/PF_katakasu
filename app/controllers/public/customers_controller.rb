class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

#会員マイページ
  def show
    @customer = Customer.find(params[:id])
    @request = Request.new
  end

#会員情報の編集
  def edit
    @customer = Customer.find(params[:id])
  end

 #編集内容の更新
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       flash[:notice] = '会員情報の更新が完了しました。'
      redirect_to my_page_path
    else
      render "edit"
    end
  end

  #退会機能（論理削除）
  def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_active: false)
    #削除後はログアウトしてTOP画面へ
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
   def customer_params
      params.require(:customer).permit(:name, :email, :postal_code, :address, :telephone_number, :is_active)
   end

end
