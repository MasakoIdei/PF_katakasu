ActiveAdmin.register Customer do

  permit_params :name, :email, :telephone_number, :is_active, :postal_code, :address
  # 一覧ページのページングの件数
  config.per_page = 10
  # actionボタンに新規作成と削除を表示しないように設定
  actions :all, except: [:new, :create, :destroy]
   menu label: "会員一覧"

  # 会員一覧画面
  index :title => "会員一覧" do
    selectable_column
    id_column
    column "会員氏名", :name
    column "メールアドレス", :email
    column "電話番号", :telephone_number
    column "会員登録", :is_active
    column "登録日", :created_at
    column "情報更新日", :updated_at

    actions
  end

  #edit画面
  form do |f|
      f.inputs "Customer" do
        f.input :name
        f.input :email
        f.input :telephone_number
        f.input :postal_code
        f.input :address
        f.input :is_active
      end
      f.actions
  end

  #会員詳細で表示する内容
 show title: :name do
    attributes_table do
      row :id
      row :name
      row :email
      row :telephone_number
      row :postal_code
      row :address
      row :is_active
      row :created_at
      row :updated_at
    end
end


end
