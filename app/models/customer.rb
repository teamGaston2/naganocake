class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :password, presence: true, length: { minimum: 6 }
  has_many :orders , dependent: :destroy
  has_many :addresses , dependent: :destroy
  has_many :cart_items , dependent: :destroy
  
  def full_name
    first_name + last_name
  end
  
 
  
  def status
    is_active ? '有効' : '退会'
  end
  
  #validates :password, presence: true, length: { minimum: 6 }

  def full_name
    self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end

  has_many :addresses, dependent: :destroy
end
