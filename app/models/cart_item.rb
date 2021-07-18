class CartItem < ApplicationRecord
   belongs_to :customer
   belongs_to :item

 #商品小計
 def item_subtotal
    (item.item_price * quantity)*1.1.round
 end


 end
