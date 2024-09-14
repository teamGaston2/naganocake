class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :address_id
      t.integer :customer_id
      t.string :post_number
      t.string :adress
      t.string :addressee

      t.timestamps
    end
  end
end
