ActiveAdmin.register OrderDatail do
  # 一覧ページのページングの件数
  config.per_page = 10
  # actionボタンに新規作成と削除を表示しないように設定
  actions :all, except: [:new, :create, :destroy]
  #タブ名の変更
   menu label: "商品レンタル状況"

   #検索フィルターの検索項目
  filter :id, label: '商品ID'
  filter :name, label: '注文者氏名'
  filter :item_name, label: '商品名'
  filter :is_rental, label: 'レンタル商品の有無'
  filter :created_at, label: '注文日'

  # 注文履歴
  index do
    selectable_column
    id_column
    #題名が商品名の商品詳細リンクを作りたい
    column "商品詳細" do |order_detail|
      #byebug
      link_to order_detail.item.item_name, admin_item_path( order_detail.item.id)
    end
    #題名が注文者氏名のリンクを作りたい（リンク先は、Orderの詳細）
    column '注文者情報' do |order_detail|
    #   # byebug

      link_to order_detail.order.customer.name, admin_customer_path(order_detail.order.customer_id)
    end
    column "注文個数", :quantity
    column :is_rental
    column :created_at

    actions
  end


end
