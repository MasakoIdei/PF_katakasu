class Public:: RequestsController < ApplicationController
  # before_action :authenticate_customer!

  def create
    @request =current_customer.requests.new(request_params)
    @request.customer_id = current_customer.id
    if @request.save
      flash[:notice] = "リクエストを送信しました。"
      redirect_back(fallback_location:root_path)
    else
      flash[:alert] = "送信に失敗しました。"
      redirect_back(fallback_location:root_path)
    end
  end

  private
  def request_params
    params.require(:request).permit(:request)
  end

end
