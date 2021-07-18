ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation


  index do
    selectable_column
    id_column
    column :email
    column :created_at
    column :updated_at
    actions
  end

#フィルターの内容で検索したい部分だけを設定
  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
