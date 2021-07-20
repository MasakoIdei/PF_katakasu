class Request < ApplicationRecord
  belongs_to :customer

  #バリデーション
  validates :request, presence: true

end
