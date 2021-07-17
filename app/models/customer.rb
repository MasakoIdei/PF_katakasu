class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アソシエーション
   has_many :cart_items, dependent: :destroy
   has_many :orders

  #退会済みの場合は、ログインできない
  def active_for_authentication?
    super && self.is_active == true
  end

end
