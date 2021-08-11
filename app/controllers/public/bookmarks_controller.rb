class Public::BookmarksController < ApplicationController
  before_action :authenticate_customer!

  #お気に入り登録
  def create
    @item = Item.find(params[:item_id])
    bookmark = @item.bookmarks.new(customer_id: current_customer.id)
    if bookmark.save
      redirect_back(fallback_location: root_path) #繊維前のページを取得
      flash[:notice] = "お気に入り登録しました"
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "登録に失敗しました"
    end
  end

  #お気に入り解除
  def destroy
    @item = Item.find(params[:item_id])
    bookmark = @item.bookmarks.find_by(customer_id: current_customer.id)
    if bookmark.present?
      bookmark.destroy
      redirect_back(fallback_location: root_path)
      flash[:notice] = "お気に入りを解除しました"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  #お気に入り一覧
  def index
     @items = current_customer.bookmarks.includes(:customer).order(created_at: :desc)
  end

end
