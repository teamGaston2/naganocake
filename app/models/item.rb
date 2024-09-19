class Item < ApplicationRecord
  has_one_attached :image

  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end


  def with_tax_price
    (price * 1.1).floor
  end


  #enum is_active: { inactive: 0, active: 1 }

  belongs_to :genre
  has_many :order_details , dependent: :destroy
  has_many :cart_items , dependent: :destroy

end
