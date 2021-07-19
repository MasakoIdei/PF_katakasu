ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation
  menu label: "管理者登録", priority: 4


  index :title => "登録情報一覧" do
    selectable_column
    id_column
    column "メールアドレス", :email
    column "登録日", :created_at
    column "更新日", :updated_at
    actions
  end

#フィルターの内容で検索したい部分だけを設定
  filter :email, label: "メールアドレス"
  filter :created_at, label: "登録日"

  form do |f|
    f.inputs do
      f.input :email, label: "メールアドレス"
      f.input :password, label: "パスワード"
      f.input :password_confirmation, label: "パスワード（確認）"
    end
    f.actions
  end

end
