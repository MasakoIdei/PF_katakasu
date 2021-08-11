class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  #重複登録無効
  validates :customer_id, uniqueness: { scope: :item_id }

end
