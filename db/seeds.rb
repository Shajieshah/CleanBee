puts "Create Admin User"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')


puts "Create User"
User.create!(email: 'user@gmail.com', user_name: 'Rana Ali', phone: '03024492335',
             address: 'Johar Town, Lahore, Pakistan', password: 'password', password_confirmation: 'password')


puts "Create Laundries"
['Torso', 'Pants', 'Suits', 'Dresses', 'Traditional', 'Home Appliances'].each do |name|
  Laundry.create(name: name)
end

puts "Create Capabilities"
['Dry Cleaning', 'Washing', 'Ironing', 'Stain Removing'].each do |name|
  Capability.create(name: name)
end


puts "Create Shops"

Vendor.create!(email: 'vendor1@example.com', password: 'password', password_confirmation: 'password')
Vendor.first.create_shop(name: 'Doha Festival City Mall', description: 'Do the stuff with innovation in daily life!', latitude: 31.520370, longitude: 74.358749)

Vendor.create!(email: 'vendor2@example.com', password: 'password', password_confirmation: 'password')
Vendor.second.create_shop(name: 'Novatore', description: 'do the stuff with innovation in daily life!', opening_time: "9", closing_time: "4", latitude: 31.520370, longitude: 74.358749)

Vendor.create!(email: 'vendor3@example.com', password: 'password', password_confirmation: 'password')
Vendor.third.create_shop(name: 'Mall of Qatar ', description: 'do the stuff with innovation in daily life!', opening_time: "9", closing_time: "4", latitude: 31.520370, longitude: 74.358749)

Vendor.create!(email: 'alie.ammaar@gmail.com', password: 'password', password_confirmation: 'password')
Vendor.fourth.create_shop(name: 'Lagoona Mall ', description: 'do the stuff with innovation in daily life!', opening_time: "9", closing_time: "4", latitude: 31.520370, longitude: 74.358749)

puts "Create Shop Services"

ShopService.create(shop_id: 1, laundry_id: 1, capability_id: 1, cost: 5)
ShopService.create(shop_id: 1, laundry_id: 1, capability_id: 2, cost: 7)
ShopService.create(shop_id: 1, laundry_id: 1, capability_id: 3, cost: 8)
ShopService.create(shop_id: 1, laundry_id: 1, capability_id: 4, cost: 10)

ShopService.create(shop_id: 1, laundry_id: 2, capability_id: 1, cost: 8)
ShopService.create(shop_id: 1, laundry_id: 2, capability_id: 2, cost: 9)
ShopService.create(shop_id: 1, laundry_id: 2, capability_id: 3, cost: 5.5)

ShopService.create(shop_id: 1, laundry_id: 5, capability_id: 1, cost: 10)
ShopService.create(shop_id: 1, laundry_id: 5, capability_id: 2, cost: 12)
ShopService.create(shop_id: 1, laundry_id: 5, capability_id: 3, cost: 13.5)
ShopService.create(shop_id: 1, laundry_id: 6, capability_id: 4, cost: 22.5)

ShopService.create(shop_id: 2, laundry_id: 1, capability_id: 1, cost: 5)
ShopService.create(shop_id: 2, laundry_id: 1, capability_id: 2, cost: 7)
ShopService.create(shop_id: 2, laundry_id: 1, capability_id: 3, cost: 8)
ShopService.create(shop_id: 2, laundry_id: 1, capability_id: 4, cost: 10)

ShopService.create(shop_id: 2, laundry_id: 2, capability_id: 1, cost: 8)
ShopService.create(shop_id: 2, laundry_id: 2, capability_id: 2, cost: 9)
ShopService.create(shop_id: 2, laundry_id: 2, capability_id: 3, cost: 5.5)

ShopService.create(shop_id: 2, laundry_id: 5, capability_id: 1, cost: 10)
ShopService.create(shop_id: 2, laundry_id: 5, capability_id: 2, cost: 12)
ShopService.create(shop_id: 2, laundry_id: 5, capability_id: 3, cost: 13.5)
ShopService.create(shop_id: 2, laundry_id: 6, capability_id: 4, cost: 22.5)

ShopService.create(shop_id: 3, laundry_id: 1, capability_id: 1, cost: 5)
ShopService.create(shop_id: 3, laundry_id: 1, capability_id: 2, cost: 7)
ShopService.create(shop_id: 3, laundry_id: 1, capability_id: 3, cost: 8)
ShopService.create(shop_id: 3, laundry_id: 1, capability_id: 4, cost: 10)

ShopService.create(shop_id: 3, laundry_id: 2, capability_id: 1, cost: 8)
ShopService.create(shop_id: 3, laundry_id: 2, capability_id: 2, cost: 9)
ShopService.create(shop_id: 3, laundry_id: 2, capability_id: 3, cost: 5.5)

ShopService.create(shop_id: 3, laundry_id: 5, capability_id: 1, cost: 10)
ShopService.create(shop_id: 3, laundry_id: 5, capability_id: 2, cost: 12)
ShopService.create(shop_id: 3, laundry_id: 5, capability_id: 3, cost: 13.5)
ShopService.create(shop_id: 3, laundry_id: 6, capability_id: 4, cost: 22.5)


puts "Create Orders"
puts "Orders# 1"

@order = Order.create(owner_id: 1, shop_id: Shop.first.id, order_type: "regular", pick_location: "Villaggio Mall, Luxury Extension Doha Qatar, Qatar", pickup_time: "12:12:12",
                      pickup_date: "12-12-12", delivery_time: "12:12:12", delivery_date: "12-12-12",
                      status: "pending", cost: 30, pick_lat: 72.22, pick_lng: 72.12, shop_lat: 12.12, shop_lng: 12.12)
@laudries = @order.order_laundries.create(order_id: @order.id, laundry_id: 1, cost: 30, notes: "Wash it clearly")
@laudries.laundry.laundry_capabilities.create(capability_id: 1)


puts "Orders# 2"
@order = Order.create(owner_id: 1, assignee_id: 1, shop_id: Shop.first.id, order_type: "regular", pick_location: "Villaggio Mall, Luxury Extension Doha Qatar, Qatar", pickup_time: "12:12:12",
                      pickup_date: "12-12-12", delivery_time: "12:12:12", delivery_date: "12-12-12",
                      status: "assigned", cost: 30, pick_lat: 72.22, pick_lng: 72.12, shop_lat: 12.12, shop_lng: 12.12)
@laudries = @order.order_laundries.create(order_id: @order.id, laundry_id: 1, cost: 30, notes: "Wash it clearly")
@laudries.laundry.laundry_capabilities.create(capability_id: 1)


puts "Orders# 3"
@order = Order.create(owner_id: 1, shop_id: Shop.first.id, order_type: "regular", pick_location: "Villaggio Mall, Luxury Extension Doha Qatar, Qatar", pickup_time: "12:12:12",
                      pickup_date: "12-12-12", delivery_time: "12:12:12", delivery_date: "12-12-12",
                      status: "picked_up_from_customer", cost: 30, pick_lat: 72.22, pick_lng: 72.12, shop_lat: 12.12, shop_lng: 12.12)
@laudries = @order.order_laundries.create(order_id: @order.id, laundry_id: 1, cost: 30, notes: "Wash it clearly")
@laudries.laundry.laundry_capabilities.create(capability_id: 1)


puts "Orders# 4"
@order = Order.create(owner_id: 1, shop_id: Shop.first.id, order_type: "regular", pick_location: "Villaggio Mall, Luxury Extension Doha Qatar, Qatar", pickup_time: "12:12:12",
                      pickup_date: "12-12-12", delivery_time: "12:12:12", delivery_date: "12-12-12",
                      status: "completed", cost: 30, pick_lat: 72.22, pick_lng: 72.12, shop_lat: 12.12, shop_lng: 12.12)
@laudries = @order.order_laundries.create(order_id: @order.id, laundry_id: 1, cost: 30, notes: "Wash it clearly")
@laudries.laundry.laundry_capabilities.create(capability_id: 1)


puts "Create Notifications"
Notification.create(message: "Order completed", title: "Order Completed", user_id: 1, shop_id: Shop.first.id, order_id: 5)
Notification.create(message: "Order completed", title: "Order Completed", user_id: 1, shop_id: Shop.first.id, order_id: 5)
Notification.create(message: "Order completed", title: "Order Completed", user_id: 1, shop_id: Shop.first.id, order_id: 5)
