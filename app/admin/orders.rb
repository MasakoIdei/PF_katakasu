ActiveAdmin.register Order do
  # 一覧ページのページングの件数
  config.per_page = 10
  # actionボタンに新規作成と削除を表示しないように設定
  actions :all, except: [:new, :create, :destroy]
  #タブ名の変更
   menu label: "注文者履歴"

end
