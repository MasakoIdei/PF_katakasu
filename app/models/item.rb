class Item < ApplicationRecord
mount_uploader :image, ImageUploader

#アソシエーション
has_many :cart_items, dependent: :destroy
has_many :order_datails
end
