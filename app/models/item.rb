class Item < ApplicationRecord
mount_uploader :image, ImageUploader

    #アソシエーション
    has_many :cart_items, dependent: :destroy
    has_many :order_datails
    #バリデーション
    with_options presence: true do
      validates :item_name
      validates :image
      validates :item_sieze
      validates :introduction
      validates :item_price
      validates :item_stock
    end
end
