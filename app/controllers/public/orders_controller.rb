class Public::OrdersController < ApplicationController
 before_action :authenticate_customer!

  def new
    @order = Order.new
  end


  def comfirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)#期間と支払い選択があるため、order_params
    @customer = current_customer# 会員住所を表示するため
  end


  def create
    @order = Order.new(order_params)#新規でorderに登録する情報（order_paramsで受け取った値）
    @order.customer_id = current_customer.id #Order内に会員IDも登録したいため、定義
    #Orderdatalisのどのカラムに情報を入れたいのかを指定。is_rentalは、注文と同時にtrueを挿入
    current_customer.cart_items.each do |cart_item|
      @order.order_datails.build(
        item_id: cart_item.item_id,
        quantity: cart_item.item.quantity,
        price: cart_item.item.item_price,
        is_rental: true,
        )
    end
    #orderの保存が上手く行った場合
    if @order.save
    current_customer.cart_items.each do |cart_item|    #カートアイテムの情報を分割
      item = Item.find(cart_item.item_id)              #注文個数の情報を探してくる
      item_stock = item.item_stock - cart_item.quantity#在庫-注文個数
      item.update!(item_stock: item_stock)             #在庫数を更新
    end

    current_customer.cart_items.destroy_all            #カートを空にする(情報の全削除)
      redirect_to order_thanks_path                    # 登録が成功した場合は、カート内の情報をすべて削除→注文完了画面を呼び出す
    else
      render "new"                                     #失敗した場合は、支払い選択画面に飛ぶ
    end

  end

  #ご注文ありがとう
  def thanks
  end

  # 注文履歴注文履歴表示
  def index
  #欲しいのはログイン中のユーザーの注文履歴
  #ログイン中のユーザーのorderテーブルに入ってる情報をすべて取得
  #対応するorder_idを持ってる、order_datelisのテーブルの情報を引っ張ってくる
   @customer = current_customer
   @orders = @customer.orders.includes(:order_datails, :items).page(params[:page]).per(12).reverse_order
  end

  def item_return
    @order = Order.find(params[:id])
    @order.order_datails.update_all(is_rental: false)
    flash[:notice] = "ご利用ありがとうございました。"
    redirect_back(fallback_location: root_path)
  end

  # 注文履歴詳細
  def show
    @order = Order.find(params[:id])
    @order_datails = @order.order_datails
  end


private

 def order_params
   params.require(:order).permit(:pay_method, :time_select,:total_price)
 end

end
