# db/seeds.rb
require 'faker'

# Create categories
5.times do
  Category.create(name: Faker::Commerce.department)
end

# Create products
60.times do
  Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 50..300.0, as_string: true),
    category_id: Category.pluck(:id).sample
  )
end

# Create users
5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
  )
end

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
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?