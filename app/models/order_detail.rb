class OrderDetail < ApplicationRecord
  enum making_status: { making_impossible:0, waiting_production:1, making:2, production_completed:3 }
  
  belongs_to :order
  belongs_to :item
end
