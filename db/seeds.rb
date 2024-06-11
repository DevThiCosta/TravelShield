# db/seeds.rb
User.destroy_all
City.destroy_all
DangerArea.destroy_all
Review.destroy_all

cities_photos = "https://res.cloudinary.com/dkcetjel5/image/upload/v1716668402/fotoRioDeJaneiro_shnysb.jpg"

# Seed Users
10.times do |i|
  User.create!(
    name: Faker::Name.name,
    email: "teste#{i + 1}@teste.com",
    phone_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.full_address,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    password: "123456",
    avatar: "https://kitt.lewagon.com/placeholder/users/ssaunier"
  )
end

# Seed Cities
cities = ConectaAddressBr::Cities.by_state_single("RJ")
districts = ["Centro", "Zona Sul", "Zona Norte", "Zona Oeste"]
created_cities = cities.map do |city|
  City.create!(
    name: city,
    district: districts.sample,
    country: "Brasil",
    state: "RJ",
    safety_tip: "Dica de segurança relevante para #{city}, #{Faker::Lorem.paragraph}",
    photo: cities_photos
  )
end

# Seed Danger Areas
rio_de_janeiro = City.find_by(name: "Rio de Janeiro")
mage = City.find_by(name: "Magé")

danger_areas = [
  {
    name: "Complexo do Alemão",
    description: "Complexo de favelas localizado na Zona Norte do Rio de Janeiro",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Cidade de Deus",
    description: "Favela localizada na Zona Oeste do Rio de Janeiro",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Rocinha",
    description: "Favela localizada na Zona Sul do Rio de Janeiro",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Jacarezinho",
    description: "Favela localizada na Zona Norte do Rio de Janeiro",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Santa Marta",
    description: "Favela localizada na Zona Sul do Rio de Janeiro",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Vila Cruzeiro",
    description: "Favela localizada na Zona Norte do Rio de Janeiro",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Bongaba",
    description: "Área em Magé com histórico de alagamentos",
    risk: rand(1..5),
    city: mage
  },
  {
    name: "Mangueira",
    description: "Bairro com risco de enchentes no Rio de Janeiro",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Turano",
    description: "Área de risco na Zona Norte do Rio de Janeiro",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Manguinhos",
    description: "Favela com histórico de problemas de infraestrutura",
    risk: rand(1..5),
    city: rio_de_janeiro
  }
]

danger_areas.each do |danger_area|
  da = DangerArea.new(danger_area)
  da.save!
  puts "Geocoded: #{da.name} - Lat: #{da.latitude}, Lng: #{da.longitude}"
end

# Seed Reviews
User.all.each do |user|
  50.times do
    Review.create!(
      title: Faker::Lorem.sentence,
      rate: rand(1..5),
      comment: Faker::Lorem.paragraph,
      user: user,
      city: created_cities.sample  # Use city: rather than city_id: Rails understands the association
    )
  end
end

puts "Seed completed!"
