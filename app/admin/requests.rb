ActiveAdmin.register Request do

  menu label: "リクエスト", priority: 5 #タブ名の変更
  config.per_page = 12 # 一覧ページの表示件数
  actions :all, except: [:new, :create, :edit] #新規作成、編集なし



  #一覧表示の表示内容
index :title => "リクエスト一覧" do
    selectable_column
    id_column
    column "提案者" do |request|
        # byebug
        link_to request.customer.name, admin_customer_path(request.customer_id)
    end
    column "リクエスト内容", :request
    column "リクエスト受信日",:created_at

    actions
end

#詳細表示
show :title => "詳細情報" do
  attributes_table :title => "詳細情報" do
    row "リクエスト受信日" do
      resource.created_at
    end
    row "提案者" do |request|
      link_to request.customer.name,admin_customer_path(request.customer_id)
    end
    row "リクエストの内容" do
    end

    row " " do
      link_to "リクエスト一覧へ戻る",admin_requests_path
    end
  end
end

end
