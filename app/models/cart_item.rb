class CartItem < ApplicationRecord

  def subtotal
    item.with_tax_price * amount
  end


  belongs_to :customer
  has_many :orders
  
  has_many :items, dependent: :destroy
end
