AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'user@gmail.com', user_name: 'Rana Ali', phone: '03024492335', address: 'Johar Town, Lahore, Pakistan', password: 'password', password_confirmation: 'password')
['Dry Cleaning','Washing','Ironing','Stain Removing'].each do |name|
	Capability.create(name: name)
end
['Torso','Pants','Suits','Dresses', 'Traditional', 'Home Appliances'].each do |name|
	Laundry.create(name: name)
end
Vendor.create!(email: 'vendor1@example.com', password: 'password', password_confirmation: 'password')
Vendor.first.create_shop(name: 'Novatore', description: 'do the stuff with innovation in daily life!', timings: '', latitude: 31.520370, longitude: 74.358749)

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

Vendor.create!(email: 'vendor2@example.com', password: 'password', password_confirmation: 'password')
Vendor.second.create_shop(name: 'Novatore', description: 'do the stuff with innovation in daily life!', timings: '', latitude: 31.520370, longitude: 74.358749)

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

Vendor.create!(email: 'vendor3@example.com', password: 'password', password_confirmation: 'password')
Vendor.third.create_shop(name: 'Novatore', description: 'do the stuff with innovation in daily life!', timings: '', latitude: 31.520370, longitude: 74.358749)

Vendor.create!(email: 'alie.ammaar@gmail.com', password: 'password', password_confirmation: 'password')
Vendor.fourth.create_shop(name: 'Novatore', description: 'do the stuff with innovation in daily life!', timings: '', latitude: 31.520370, longitude: 74.358749)