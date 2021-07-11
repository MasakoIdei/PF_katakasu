class Public::CustomersController < ApplicationController

#会員マイページ
  def show
    @customer = Customer.find(params[:id])
  end

#会員情報の編集
  def edit
  end

 #編集内容の更新
  def update
  end

end
