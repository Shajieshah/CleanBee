AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create(email: 'user@gmail.com', user_name: 'Rana Ali', phone: '03024492335', address: 'Johar Town, Lahore, Pakistan', password: 'password', password_confirmation: 'password')
['Dry Cleaning','Washing','Ironing','Stain Removing'].each do |name|
	Capability.create(name: )
end