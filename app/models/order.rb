class Order < ApplicationRecord


  #アソシエーション
  belongs_to :customer
  has_many :order_datails
  has_many :items, through: :order_datails

  #バリデーション
  with_options presence: true do
    validates :quantity
    validates :total_price
  end

  enum pay_method:{クレジット: 0, 銀行振込: 1}

  #商品小計
    def item_subtotal
      (item.item_price * quantity)*1.1.round
    end


end
