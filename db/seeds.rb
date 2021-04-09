# Seeds

# Creating a User
user = User.create email: 'sarah@test.com', password: '123456', password_confirmation: '123456'

# Creating apartments
apartments = [
  {
    street: '221B Baker Street',
    city: 'London',
    state: 'England',
    manager: 'Ms. Hudson',
    email: 'mzhud@email.com',
    price: '1000',
    bedrooms: 2,
    bathrooms: 2,
    pets: 'no',
    user_id: user.id
  },
  {
    street: '221A Baker Street',
    city: 'London',
    state: 'England',
    manager: 'Ms. Hudson',
    email: 'mzhud@email.com',
    price: '1500',
    bedrooms: 3,
    bathrooms: 3,
    pets: 'no',
    user_id: user.id
  }
]

apartments.each do |attr|
  Apartment.create attr
  puts "creating apartment: #{attr}"
end
