ActiveAdmin.register Item do

  permit_params :item_name, :image, :item_sieze, :introduction, :item_price, :item_stock
  config.per_page = 5 # 一覧ページのページングの件数
  menu label: "商品"


 #検索フィルターの検索項目
  filter :id, label: '商品ID'
  filter :item_name, label: '商品名'
  filter :item_stock, label: '商品在庫'
  filter :created_at, label: '登録日'

 #商品一覧画面の表示内容
  index do
    selectable_column
    id_column
    column :image do |i|
      image_tag(i.image.url, height: 10)
    end
    column :item_name
    column :item_sieze
    column :item_stock
    column :created_at

    actions
  end

 #商品編集の編集欄
  form do |f|
      f.inputs "Item" do
        f.input :item_name
        f.input :image
        f.input :item_sieze
        f.input :introduction
        f.input :item_price
        f.input :item_stock
      end
      f.actions
  end

#商品詳細で表示する内容
 show title: :item_name do |i|
    attributes_table do
      row :id
      row :item_name
      row :image do
        image_tag(i.image.url)
      end
      row :item_price
      row :item_stock
      row :item_sieze
      row :introduction
      row :created_at
      row :updated_at
    end
end


end
