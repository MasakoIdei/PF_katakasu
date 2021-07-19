ActiveAdmin.register OrderDatail do

  menu label: "商品レンタル状況", priority: 0 #タブ名の変更
  config.per_page = 10 # 一覧ページの表示件数
  actions :all,  except:[:new, :create, :destroy, :edit]#actionボタンの内容制限


#検索フィルターの検索項目
  filter :is_rental, label: 'レンタル商品の有無'
  filter :created_at, label: '注文日'


#レンタル状況一覧の表示内容
  index :title => "商品レンタル状況・一覧" do
    selectable_column
    id_column
    column "商品名" do |order_detail|#商品詳細リンク
      #byebug
      link_to order_detail.item.item_name, admin_item_path( order_detail.item.id)
    end
    column "注文者" do |order_detail|
      # byebug
      link_to order_detail.order.customer.name, admin_customer_path(order_detail.order.customer_id)
    end
    column "貸出個数", :quantity
    column "レンタルの有無", :is_rental
    column "注文日時", :created_at

    actions
  end

#詳細表示の表示内容
  show :title => "詳細情報" do
    attributes_table :title => "詳細情報" do
      row "レンタルの有無" do |order_detail|
        order_detail.is_rental ? "レンタル中の商品です" : "返却済み商品です"
      end
      row '注文日' do
        resource.created_at
      end
      row "注文者" do |order_detail|
         # byebug
         link_to order_detail.order.customer.name, admin_customer_path(order_detail.order.customer_id)
      end
      row "商品名" do |order_detail|
        #byebug
        link_to order_detail.item.item_name, admin_item_path( order_detail.item.id)
      end
      row "商品単価" do |order_detail|
        "#{order_detail.price}円/週"
      end
      row "注文個数" do|order_detail|
        "#{order_detail.quantity}セット"
      end
      row " " do
        link_to "レンタル状況一覧へ戻る",admin_order_datails_path
      end

    end
 end


end
