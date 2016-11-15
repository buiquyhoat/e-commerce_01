# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "buiquyhoat",
  email: "buiquyhoat@gmail.com",
  address: "ha noi",
  password: "123456",
  admin: true)

Category.create(category_name: "men", left_node: 0, right_node: 1, depth: 0)

(1..10).each do |stt|
  Product.create(
    product_name: "T-Shirt-Blue #{stt}",
    uuid: "uuid #{stt}",
    description: "good products, affordable prices, excellent quality,
      perfect on both, best buy for all",
    price: (100 * stt),
    rating: 0,
    quantity: (100 + stt),
    category_id: 1
    )
end

(1..10).each do |stt|
  Color.create(color_name: "red", product_id: stt)
end
(1..10).each do |stt|
  Color.create(color_name: "green", product_id: stt)
end
(1..10).each do |stt|
  Color.create(color_name: "blue", product_id: stt)
end
(1..10).each do |stt|
  Size.create(size_name: "X", product_id: stt)
end
(1..10).each do |stt|
  Size.create(size_name: "XL", product_id: stt)
end
(1..10).each do |stt|
  Size.create(size_name: "M", product_id: stt)
end

Order.create(
  status: 0,
  total_amount: 1000,
  user_id: 1,
  shipping_name: "hoat",
  shipping_email: "buiquyhoat@gmail.com",
  shipping_address: "ha noi"
)
Order.create(
  status: 0,
  total_amount: 5200,
  user_id: 1,
  shipping_name: "hoat",
  shipping_email: "buiquyhoat@gmail.com",
  shipping_address: "ha noi"
)
Order.create(
  status: 0,
  total_amount: 6000,
  user_id: 1,
  shipping_name: "hoat",
  shipping_email: "buiquyhoat@gmail.com",
  shipping_address: "ha noi"
)

(1..4).each do |stt|
  OrderDetail.create(
    quantity: 1,
    order_id: 1,
    product_id: stt,
    product_name: "T-Shirt-Blue #{stt}",
    product_uuid: "uuid #{stt}"
  )
end
(5..8).each do |stt|
  OrderDetail.create(
    quantity: 2,
    order_id: 2,
    product_id: stt,
    product_name: "T-Shirt-Blue #{stt}",
    product_uuid: "uuid #{stt}"
  )
end
OrderDetail.create(
  quantity: 3,
  order_id: 3,
  product_id: 1,
  product_name: "T-Shirt-Blue 1",
  product_uuid: "uuid 1"
)
OrderDetail.create(
  quantity: 4,
  order_id: 3,
  product_id: 3,
  product_name: "T-Shirt-Blue 3",
  product_uuid: "uuid 3"
)
OrderDetail.create(
  quantity: 2,
  order_id: 3,
  product_id: 5,
  product_name: "T-Shirt-Blue 5",
  product_uuid: "uuid 5"
)
OrderDetail.create(
  quantity: 5,
  order_id: 3,
  product_id: 7,
  product_name: "T-Shirt-Blue 7",
  product_uuid: "uuid 7"
)
