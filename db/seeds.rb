# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
email = "user@user.com"
password = "password"

# Resets the default user.
if user = User.find_by_email(email)
  user.destroy
end

User.create({
                email: email,
                password: password,
                password_confirmation: password
            })
puts "seed user created: #{email}:#{password}"


100.times do |i|
  Contact.create name: Faker::Name.name,
                 phone: Faker::PhoneNumber.phone_number,
                 state: Faker::Address.state,
                 properties: {business_name: Faker::Company.name,
                              address: Faker::Address.street_name,
                              city: Faker::Address.city,
                              state: Faker::Address.state,
                              postal: Faker::Address.zip_code,
                              tagline: Faker::Company.catch_phrase,
                              logo: Faker::Company.logo,
                              website: Faker::Internet.url}
end

if ENV['migrate']
  Contact.all.each do |c|
    c.update_attribute :state, c.properties['state']
  end
end