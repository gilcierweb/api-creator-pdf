# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Customer"
10.times do
  name = Faker::Lorem.word
  contract_value = Faker::Number.decimal(l_digits: 2)
  location = Faker::Address.city
  phone = Faker::PhoneNumber.phone_number

  customer = Customer.create(name: name, contract_value: contract_value, location: location, phone: phone)

  pdf_url = Faker::Internet.url
  description = Faker::Lorem.sentence

  document = Document.create(pdf_url: pdf_url, description: description, customer: customer)
  document
end

puts "End seed Customer"