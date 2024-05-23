User.destroy_all
City.destroy_all

# Seed Users
10.times do |i|
  User.create!(
    name: Faker::Name.name,
    email: "teste#{i+1}@teste.com",
    phone_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.full_address,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    reviews: Faker::Lorem.paragraph,
    password: "123456"
  )
end

# Seed Cities
cities = ConectaAddressBr::Cities.by_state_single("RJ")
districts = ["Centro", "Zona Sul", "Zona Norte", "Zona Oeste"]
cities.each do |city|
  City.create!(
    name: city,
    district: districts.sample,
    country: "Brasil",
    state: "RJ",
    safety_tip: Faker::Lorem.paragraph
  )
end
