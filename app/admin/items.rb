ActiveAdmin.register Item do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :item_name, :image, :item_sieze, :introduction, :item_price, :item_stock
  #
  # or
  #
  # permit_params do
  #   permitted = [:item_name, :image, :item_sieze, :introduction, :item_price, :item_stock]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :item_name, :image, :item_sieze, :introduction, :item_price, :item_stock
  config.per_page = 5 # 一覧ページのページングの件数


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




  form(:html => { :multipart => true }) do |f|
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

 show do |i|
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
