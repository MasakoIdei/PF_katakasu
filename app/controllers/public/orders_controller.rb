class Public::OrdersController < ApplicationController

  # 支払い、期間選択
  def new
    @order = Order.new
  end


  def comfirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @customer = current_customer# 会員住所を表示するため

  end


  def create
     #注文したユーザーのID,支払い時の選択情報、請求金額の合計
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id


    #注文履歴作成、#is_rentalにtrueと情報を保存する
    # order_datailsの中に、商品ID、orderID、商品個数、その時の価格、
    current_customer.cart_items.each do |cart_item|
      @order.order_datails.build(
        item_id: cart_item.item_id,
        quantity: cart_item.quantity,
        price: cart_item.item.item_price,
        is_rental: true,
        )
    end


    if @order .save
          #在庫から注文した分の個数を引き、在庫数に反映させる
    #  itemテーブルにある、item_stockの個数を変更し、保存する
    current_customer.cart_items.each do |cart_item|
      item = Item.find(cart_item.item_id)
      item_stock = item.item_stock - cart_item.quantity
      item.update!(item_stock: item_stock)
    end

    #カートを空にする
    # 登録が成功した場合は、カート内の情報をすべて削除→注文完了画面を呼び出す
    current_customer.cart_items.destroy_all
      redirect_to order_thanks_path
    else
      render "new"
    end

  end

  #ご注文ありがとう！
  def thanks
  end

  # 注文履歴注文履歴表示
  def index
  end

  # 注文履歴詳細
  def show
  end





private

 def order_params
   params.require(:order).permit(:pay_method, :time_select,:total_price)
 end

end
