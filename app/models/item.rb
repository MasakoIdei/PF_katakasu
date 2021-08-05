class Item < ApplicationRecord
mount_uploader :image, ImageUploader

    #アソシエーション
    has_many :cart_items, dependent: :destroy
    has_many :order_datails
    has_many :bookmarks, dependent: :destroy

    #バリデーション
    with_options presence: true do
      validates :item_name
      validates :image
      validates :item_sieze
      validates :introduction
      validates :item_price
      validates :item_stock
    end

    def bookmarked_by?(customer)
      bookmarks.where(customer_id: customer).exists?
    end

end