AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'user@gmail.com', user_name: 'Rana Ali', phone: '03024492335', address: 'Johar Town, Lahore, Pakistan', password: 'password', password_confirmation: 'password')
Vendor.create!(email: 'vendor@gmail.com', password: 'password', password_confirmation: 'password') unless Vendor.first.present?
Shop.create!(vendor: Vendor.first, name: 'Novatore', description: 'Comes with innovation in daily life blah blah', timings: '', latitude: 31.520370, longitude: 74.358749)
['Dry Cleaning','Washing','Ironing','Stain Removing'].each do |name|
	Capability.create(name: name)
end
['Torso','Pants','Suits','Dresses', 'Traditional', 'Home Appliances'].each do |name|
	Laundry.create(name: name)
end
