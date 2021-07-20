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

  #退会機能（論理削除）
  def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_active: false)
    reset_session　#削除後はログアウトしてTOP画面へ
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
   def customer_params
      params.require(:customer).permit(:name, :email, :postal_code, :address, :telephone_number, :is_active)
   end

end
