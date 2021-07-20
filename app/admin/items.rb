ActiveAdmin.register Item do

  menu label: "商品一覧", priority: 2#タブ名の変更
  config.per_page = 5 # 一覧ページの表示件数
  permit_params :item_name, :image, :item_sieze, :introduction, :item_price, :item_stock


#検索フィルターの検索項目
  filter :id, label: '商品ID'
  filter :item_name, label: '商品名'
  filter :item_stock, label: '商品在庫'
  filter :created_at, label: '登録日'


 #商品一覧画面の表示内容
  index :title => "商品一覧" do
    selectable_column
    id_column
    column "商品画像" do |i|
      image_tag(i.image.url, height: 10)
    end
    column "商品名", :item_name
    column "サイズ", :item_sieze
    column "在庫数", :item_stock
    column "商品登録日", :created_at

    actions
  end

#商品編集の編集欄
  form title: "新規登録 / 編集" do |f|
      f.inputs "登録フォーム" do
        f.input :item_name, label: "商品名"
        f.input :image,label: "商品画像"
        f.input :item_sieze, label: "商品サイズ / セット数"
        f.input :introduction, label: "商品ポイント"
        f.input :item_price, label: "商品価格（単価 / 週）"
        f.input :item_stock, label: "在庫数"
      end
      f.actions
  end

#商品詳細で表示する内容
 show title: :item_name do
    attributes_table :title => "詳細情報" do
      row "商品ID" do
        resource.id
      end
      row "商品名" do
        resource.item_name
      end
      row :image do |i|
        image_tag(i.image.url)
      end
      row "商品価格(単価 / 週)" do
        resource.item_price
      end
      row "商品在庫" do
        resource.item_stock
      end
      row "商品サイズ / セット" do
        resource.item_sieze
      end
      row "商品ポイント" do
        resource.introduction
      end
      row "登録日" do
        resource.created_at
      end
      row "更新日" do
        resource.updated_at
      end
      row " " do
        link_to "商品一覧へ戻る",admin_items_path
      end
    end
end


end
