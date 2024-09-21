# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'test@test.com',
    password: "testhoge"
)

CartItem.create!(
  customer_id: 1,
  item_id: 1,
  amount: 5
)

Order.create!(
    customer_id: '1' ,
    postal_code: '123456' ,
    address: 'test' ,
    name: 'test' ,
    shipping_cost: 800 ,
    total_payment: 9000 ,
    payment_method: :transfer ,
    order_status: :making
    )

OrderDetail.create!(
    order_id: 1,
    item_id: 1,
    price: 100,
    amount: 5,
    making_status: :making
  )