class Item < ApplicationRecord
  
  def with_tax_price
    (price * 1.1).floor
  end
  
  belongs_to :cart_item
  
end
