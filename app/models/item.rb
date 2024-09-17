class Item < ApplicationRecord
  
  def with_tax_price
    (price * 1.1).floor
  end
  
  belongs_to :genres
  has_many :order_details , dependent: :destroy
  
end
