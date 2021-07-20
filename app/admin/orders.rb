ActiveAdmin.register Order do

  menu label: "注文者履歴", priority: 1#タブ名の変更
  config.per_page = 10# 一覧ページのページングの件数
  actions :all, except: [:new, :create, :destroy,:edit] # actionボタンに新規作成と削除を表示しないように設定

#検索フィルターの検索項目
filter :id, label: '注文ID'
filter :created_at, label: '注文日'


#一覧表示の表示内容
index :title => "注文者履歴" do
    selectable_column
    id_column
    column "注文者氏名" do |order|
        # byebug
        link_to order.customer.name, admin_customer_path(order.customer_id)
    end
    column "レンタル期間" do|order|
    "#{order.time_select}週間"
    end
    column "注文日",:created_at

    actions
end

#詳細表示
  show :title => "詳細情報" do
      attributes_table :title => "詳細情報" do
          row "注文日" do
              resource.created_at
          end
          row "注文者氏名" do |order|
              link_to order.customer.name,admin_customer_path(order.customer_id)
          end
          row "支払い方法" do
              resource.pay_method
          end
          row "レンタル期間" do |order|
              "#{order.time_select}週間"
          end
      end
  end



end
