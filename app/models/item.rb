class Item < ApplicationRecord
  has_one_attached :image
  def with_tax_price
    (price * 1.1).floor
  end


  enum is_active: { 販売中: 0, 販売停止中: 1 }

  belongs_to :genre
  has_many :order_details , dependent: :destroy


  
  belongs_to :cart_item
  
end
