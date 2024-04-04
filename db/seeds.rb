# db/seeds.rb
require 'faker'

Product.destroy_all
User.destroy_all
Order.destroy_all
OrderItem.destroy_all
Contact.destroy_all

# Create categories
5.times do
  Category.create(name: Faker::Commerce.department)
end
puts("c done")
# Create products
60.times do
  p = Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 50..300.0, as_string: true),
    category_id: Category.pluck(:id).sample,
    sale: [true, false].sample
  )
  puts(p.name)
  puts(p.sale)
end

puts("p done")
# Create users
5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
  )
end
puts("u done")

# Create orders
5.times do
  user = User.all.sample
  order = user.orders.create(total_price: 0)
  3.times do
    product = Product.all.sample
    quantity = Faker::Number.between(from: 1, to: 5)
    order_item = order.order_items.create(product_id: product.id, quantity: quantity)
    order.total_price += (product.price.to_f * quantity)
  end
  order.save
end

# # Find each province record and update its tax rates
# Province.all.each do |province|
#   case province.name
#   when "Alberta"
#     province.update(gst: 5.0, pst: 0.0, hst: 0.0)
#   when "British Columbia"
#     province.update(gst: 5.0, pst: 7.0, hst: 0.0)
#   when "Manitoba"
#     province.update(gst: 5.0, pst: 7.0, hst: 0.0)
#   when "New Brunswick"
#     province.update(gst: 0.0, pst: 10.0, hst: 0.0)
#   when "Newfoundland and Labrador"
#     province.update(gst: 0.0, pst: 10.0, hst: 0.0)
#   when "Nova Scotia"
#     province.update(gst: 0.0, pst: 0.0, hst: 15.0)
#   when "Ontario"
#     province.update(gst: 0.0, pst: 0.0, hst: 13.0)
#   when "Prince Edward Island"
#     province.update(gst: 0.0, pst: 10.0, hst: 0.0)
#   when "Quebec"
#     province.update(gst: 5.0, pst: 9.975, hst: 0.0)
#   when "Saskatchewan"
#     province.update(gst: 5.0, pst: 6.0, hst: 0.0)
#   # Add more cases for other provinces if needed
#   end
# end
