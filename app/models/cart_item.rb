class CartItem < ApplicationRecord
  
  def subtotal
    item.with_tax_price * amount
  end
  
  has_many :items, dependent: :destroy
end
