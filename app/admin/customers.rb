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
  form title: "会員情報編集" do |f|
      f.inputs "編集フォーム" do
        f.input :name, label: "会員氏名"
        f.input :email, label: "メールアドレス"
        f.input :telephone_number, label: "電話番号"
        f.input :postal_code, label: "郵便番号"
        f.input :address, label: "住所"
        f.input :is_active, label: "有効"
      end
      f.actions
  end

  #会員詳細で表示する内容
 show title: :name do
    attributes_table :title =>"会員情報" do
      row "会員ID" do
        :id
      end
      row "会員氏名" do
        :name
      end
      row "メールアドレス" do
        :email
      end
      row "電話番号" do
        :telephone_number
      end
      row "郵便番号"  do
        :postal_code
      end
      row "住所" do
        :address
      end
      row "有効 / 無効" do
        :is_active
      end
      row "登録日" do
        :created_at
      end
      row "更新日" do
        :updated_at
      end
    end
end


end