class Public::CartItemsController < ApplicationController
 before_action :authenticate_customer!

   #商品詳細から送られてきたデータの受け取りと保存
  def create
   @item = Item.find(params[:cart_item][:id])
   @cart_item = CartItem.new

   #元々、入っている商品の情報を取得してくる
    @old_cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:id])

    #もし、 @old_cart_itemが存在している場合は個数を足して、値を更新する（新しいレコードは作らない）
    if @old_cart_item.present?
     @old_cart_item.update(quantity: @old_cart_item.quantity += params[:cart_item][:quantity].to_i)
    else
     #該当がない場合は、新しく作るレコードに以下の情報を保存する
     @cart_item.customer_id = current_customer.id
     @cart_item.item_id = @item.id
     @cart_item.quantity = params[:cart_item][:quantity].to_i
     @cart_item.save
    end
      redirect_to cart_items_path
  end

  def index
    #アソシエーションもしてあってテーブルの中に
    #current_customerのidも入ってるから、この↓書き方よりも
    # @cart_items = CartItem.where(customer_id:current_customer.id)
    #この↓書き方の方がこの場合だとすっきりして分かりやすい
    @cart_items = current_customer.cart_items
  end


# 商品毎の削除
  def destroy
     @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      flash[:notice] = 'カート内の商品が削除されました'
    else
      flash[:alert] = '削除に失敗しました'
    end
    redirect_to cart_items_path
  end


 # カートアイテム内の商品をすべて削除（該当のレコード内の情報を削除する）
  def destroy_all
   @cart_items = current_customer.cart_items
   @cart_items.destroy_all
   flash[:alert] = "カートの商品を全て削除しました"
   redirect_to cart_items_path
  end



  #商品内容の更新
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity = params[:cart_item][:id]
    @cart_item.update(cart_item_params)
    flash[:success] = '個数を変更しました'
    redirect_back(fallback_location: root_path)
  end

  private

   def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
   end


end
