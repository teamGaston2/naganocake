class Address < ApplicationRecord
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end

  belongs_to :customer

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

end