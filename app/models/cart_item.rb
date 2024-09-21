class CartItem < ApplicationRecord
  def subtotal
    item.with_tax_price * amount
  end

  belongs_to :customer
  has_many :orders
  belongs_to :item

  validates :amount, numericality: { less_than_or_equal_to: 10, message: 'は10個以下で指定してください。' }
end
