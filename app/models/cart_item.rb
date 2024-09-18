class CartItem < ApplicationRecord

  def subtotal
    item.with_tax_price * amount
  end

  belongs_to :customer
end
