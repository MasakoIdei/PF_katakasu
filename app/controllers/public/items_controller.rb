class Public::ItemsController < ApplicationController

  #商品一覧の表示
  def index
    @items = Item.all
  end

  #商品詳細表示
  def show
    @item = Item.find(params[:id])
  end

end
