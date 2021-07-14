class Order < ApplicationRecord


  #アソシエーション
  belongs_to :customer
  has_many :order_datails, dependent: :destroy



  enum pay_method:{クレジット: 0, 銀行振込: 1}


end
