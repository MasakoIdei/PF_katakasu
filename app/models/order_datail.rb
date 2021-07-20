class OrderDatail < ApplicationRecord
  belongs_to :item
  belongs_to :order


 #バリデーション
  with_options presence: true do
    validates :quantity
    validates :price
  end

end

