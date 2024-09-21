class Item < ApplicationRecord
  has_one_attached :image

  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end


  def with_tax_price
    (price * 1.1).floor
  end

  validates :name, presence: { message: "を入力してください" }, length: { maximum: 255, message: "は255文字以内で入力してください" }
  validates :introduction, presence: { message: "を入力してください" }
  validates :price, presence: { message: "を入力してください" }, numericality: { greater_than: 0, message: "は0より大きい数値で入力してください" }
  validates :genre_id, presence: { message: "を選択してください" }
  validates :is_active, inclusion: { in: [true, false], message: "が無効です" }
  validates :image, presence: { message: "をアップロードしてください" }


  #enum is_active: { inactive: 0, active: 1 }

  belongs_to :genre
  has_many :order_details , dependent: :destroy
  has_many :cart_items , dependent: :destroy
end
