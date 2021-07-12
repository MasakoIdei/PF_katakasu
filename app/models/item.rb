class Item < ApplicationRecord
mount_uploader :image, ImageUploader

#カートアソシエーション
has_many :cart_items, dependent: :destroy
end
