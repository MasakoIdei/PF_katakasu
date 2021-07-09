class Public::CartItemsController < ApplicationController

  def index
    # @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end

  def destroy
  end

 #カートを空にする
  def destroy_all
  end

 #商品の追加
  def create
  end

  #商品内容の更新
  def update
  end

  private

   def cart_items_params
    params.require(:cart_item).permit(:quantity, :item_id)
   end

end
