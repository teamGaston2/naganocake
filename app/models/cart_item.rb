class CartItem < ApplicationRecord

  def subtotal
    item.with_tax_price * amount
  end


  belongs_to :customer
  has_many :orders
  
  belongs_to :item
end
