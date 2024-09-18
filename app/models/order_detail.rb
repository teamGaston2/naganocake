class OrderDetail < ApplicationRecord
  enum making_status: { making_impossible:0, waiting_production:1, making:2, production_completed:3 }

  def subtotal
    price * amountexit
  end

  belongs_to :order
  belongs_to :item


end
