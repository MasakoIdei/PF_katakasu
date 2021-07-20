class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アソシエーション
   has_many :cart_items, dependent: :destroy
   has_many :orders
   has_many :requests, dependent: :destroy

   #バリデーション
  with_options presence: true do
    validates :name
    validates :email
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
    validates :postal_code, format: { with: /\A\d{7}\z/ }
    validates :address
  end

  #退会済みの場合は、ログインできない
  def active_for_authentication?
    super && self.is_active == true
  end

end
