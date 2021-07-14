class Order < ApplicationRecord


  #アソシエーション
  belongs_to :customer
  has_many :order_datails, dependent: :destroy



  enum pay_method:{支払い方法を選択してください: 0, クレジット: 1, 銀行振込: 2}
  # enum time_select:{レンタル期間を選択してください: 0, １週間: 1, ２週間: 2, ３週間: 3}


end
