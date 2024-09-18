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

Order.create!(
   order_id: '1' ,
   customer_id: '1' ,
   postal_code: '123456' ,
   address: 'test' ,
   name: 'test' ,
   shipping_cost: '800' ,
   total_payment: '9000' ,
   payment_method: 'transfer' ,
   order_status: 'making'
   )