class CartItem < ApplicationRecord

  def subtotal
    item.with_tax_price * amount
  end


  belongs_to :customer
  has_many :orders

  belongs_to :item

  def validate_item_count
    max_cart_items = 10
    errors.add(:cart_item, "は#{max_cart_items}個までしか追加できません") if CartItem.count >= max_cart_items
  end
end
