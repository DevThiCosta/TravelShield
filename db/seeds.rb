# db/seeds.rb
User.destroy_all
City.destroy_all
DangerArea.destroy_all
Review.destroy_all

cities_photos = "https://res.cloudinary.com/dkcetjel5/image/upload/v1716668402/fotoRioDeJaneiro_shnysb.jpg"

# Generate different city descriptions
cities_descriptions = [
  "Conhecida por suas belas praias e vida noturna vibrante, esta cidade é um dos destinos turísticos mais populares do Brasil.",
  "Com uma rica herança cultural e diversos pontos históricos, esta cidade oferece um mergulho na história do Brasil.",
  "Cidade industrial com grande importância econômica, conhecida por sua infraestrutura e desenvolvimento.",
  "Com um cenário deslumbrante de montanhas e florestas, esta cidade é perfeita para os amantes da natureza.",
  "Oferecendo uma mistura única de tradição e modernidade, esta cidade encanta seus visitantes com sua arquitetura e cultura."
]

# Generate different user bios in Portuguese
user_bios = [
  "Aventureiro(a) 🌍, sempre em busca de novas experiências e culturas.",
  "Amante da fotografia 📸 e das trilhas ao ar livre.",
  "Apaixonado(a) por tecnologia e inovação 💻.",
  "Cozinheiro(a) nas horas vagas, sempre experimentando novas receitas 🥘.",
  "Leitor(a) ávido(a), mãos sempre em um livro 📚.",
  "Mestre em yoga e meditação 🧘‍♂️, buscando um equilíbrio interior.",
  "Viciado(a) em filmes e séries 🍿🎬.",
  "Explorador(a) urbano(a) 🏙️, encontrando os melhores cafés e restaurantes.",
  "Entusiasta de esportes 🚴‍♂️, especialmente ciclismo e corrida.",
  "Artista nas horas vagas, apaixonado(a) por pintura e desenho 🎨.",
  "Engenheiro(a) de software, sempre procurando novos desafios 👨‍💻.",
  "Músico(a) 🎸, tocando guitarra e cantando em uma banda local.",
  "Apreciador(a) de vinhos 🍷 e boa comida.",
  "Apaixonado(a) por viagens de carro e acampamentos 🏕️.",
  "Defensor(a) dos direitos dos animais 🐾, sempre procurando ajudar."
]

# Generate good review titles and comments in Portuguese
good_review_titles = [
  "Experiência incrível!", "Maravilhoso!", "Bom custo-benefício", "Superou expectativas",
  "Perfeito!", "Excepcional", "Ótimo lugar", "Satisfatório", "Fantástico", "Recomendo",
  "Excelente", "Amei!", "Lugar agradável", "Surpreendente", "Boa localização", "Silencioso e confortável",
  "Lugar encantador", "Bela vista", "Impecável", "Adorei a estadia", "Voltaria com certeza",
  "Acesso fácil", "Confortável", "Muito aconchegante", "Vale a pena", "Hospedagem impecável",
  "Cidade acolhedora", "Passeios imperdíveis", "Segurança excelente", "Muita diversidade",
  "Gastronomia incrível", "Cidade charmosa", "Excelente infraestrutura", "Bem tranquilo"
]

good_review_comments = [
  "Tive uma experiência incrível neste lugar! A vista é maravilhosa e todos foram muito acolhedores.",
  "Lugar maravilhoso! Espero voltar em breve para aproveitar mais.",
  "O lugar oferece um bom custo-benefício. Penso em voltar futuramente.",
  "Superou minhas expectativas! Recomendo fortemente.",
  "Foi simplesmente perfeito! Cada detalhe foi pensado com carinho.",
  "Um lugar excepcional, com atendimento de primeira.",
  "Ótimo lugar para descansar e aproveitar a natureza.",
  "Satisfatório, mas pode melhorar em alguns aspectos.",
  "Fantástico! Foi uma experiência inesquecível.",
  "Recomendo para quem busca um lugar tranquilo e aconchegante.",
  "Excelente! Um dos melhores locais que já visitei.",
  "Amei! Foi uma experiência incrível.",
  "Lugar agradável e com uma vista espetacular.",
  "Foi surpreendente em todos os sentidos.",
  "Boa localização, perto de tudo e de fácil acesso.",
  "O local é silencioso e muito confortável.",
  "Lugar encantador, me senti em casa.",
  "A vista é simplesmente bela, de tirar o fôlego.",
  "Impecável em todos os sentidos.",
  "Adorei a estadia. Fui muito bem recebido.",
  "Voltaria com certeza! Foi uma experiência muito boa.",
  "Acesso fácil e bem localizado.",
  "Muito confortável, ideal para o descanso.",
  "Muito aconchegante, me senti em casa.",
  "Vale a pena conhecer este lugar encantador.",
  "Hospedagem impecável, com atendimento de primeira.",
  "Cidade acolhedora e cheia de vida.",
  "Passeios imperdíveis e muita coisa para fazer.",
  "A segurança do local é excelente. Me senti muito seguro.",
  "Muita diversidade para explorar e conhecer.",
  "A gastronomia é simplesmente incrível! Variedade e sabor.",
  "Cidade charmosa e cheia de história.",
  "Excelente infraestrutura, com tudo o que você precisa.",
  "Muito tranquilo e ideal para relaxar."
]

# Generate bad review titles and comments in Portuguese
bad_review_titles = [
  "Não voltarei", "Decepcionante", "Muito ruim", "Pode melhorar", "Péssimo atendimento", "Nada de especial",
  "Não recomendo", "Barulhento demais", "Desorganizado", "Mediano", "Comodidades ruins", "Péssimas condições",
  "Muito caro", "Limpeza duvidosa", "Desastre total", "Falta manutenção"
]

bad_review_comments = [
  "Infelizmente, minha experiência não foi das melhores. Não pretendo voltar.",
  "A experiência foi decepcionante. Esperava mais.",
  "Achei muito ruim. Não recomendo.",
  "Pode melhorar em vários pontos, mas tem potencial.",
  "O atendimento foi péssimo. Precisa de melhorias urgentes.",
  "Nada de especial. Esperava algo mais.",
  "Não recomendo. Há opções melhores.",
  "O barulho excessivo me incomodou bastante.",
  "O local é desorganizado. Precisa de uma boa reforma.",
  "Mediano, sem muitos pontos altos.",
  "As comodidades deixam a desejar.",
  "Péssimas condições de conservação.",
  "Achei muito caro para o que oferece.",
  "A limpeza do local deixou a desejar.",
  "Um desastre total. Não gostei de nada.",
  "Falta manutenção em algumas áreas."
]

# Seed Users
15.times do |i|
  User.create!(
    name: Faker::Name.name,
    email: "teste#{i + 1}@teste.com",
    phone_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.full_address,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    password: "123456",
    bio: user_bios[i], # Assign each user a unique bio
    avatar: Faker::Avatar.image
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
    photo: cities_photos,
    description: cities_descriptions.sample
  )
end

# Seed Danger Areas
rio_de_janeiro = City.find_by(name: "Rio de Janeiro")
mage = City.find_by(name: "Magé")

danger_areas = [
  {
    name: "Complexo do Alemão",
    description: "Complexo de favelas localizado na Zona Norte do Rio de Janeiro. É uma área de alta criminalidade, com frequentes confrontos entre facções e a polícia. Possui um alto índice de tráfico de drogas e as condições de vida são precárias.",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Cidade de Deus",
    description: "Favela localizada na Zona Oeste do Rio de Janeiro, conhecida pelo filme homônimo. A área sofre com a violência relacionada ao tráfico de drogas e apresenta carências em infraestrutura básica e saneamento.",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Rocinha",
    description: "Favela localizada na Zona Sul do Rio de Janeiro, é uma das maiores da América Latina. Apesar de ser um ponto turístico, a Rocinha enfrenta problemas graves de segurança, com incidência de tráfico de drogas e conflitos armados.",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Jacarezinho",
    description: "Favela localizada na Zona Norte do Rio de Janeiro, tem histórico de confrontos violentos entre traficantes e forças de segurança. As condições de vida dos moradores são complicadas, com falta de serviços básicos.",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Santa Marta",
    description: "Favela localizada na Zona Sul do Rio de Janeiro, conhecida por projetos sociais e iniciativas de pacificação. No entanto, ainda enfrenta desafios de segurança, principalmente relacionados ao tráfico de drogas.",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Vila Cruzeiro",
    description: "Favela localizada na Zona Norte do Rio de Janeiro, notória por tiroteios e conflitos entre facções criminosas. A área apresenta dificuldades significativas em termos de infraestrutura e segurança.",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Bongaba",
    description: "Área em Magé com histórico de alagamentos frequentes, o que representa um risco para os moradores. Os problemas de infraestrutura e a falta de serviços básicos agravam a situação da região.",
    risk: rand(1..5),
    city: mage
  },
  {
    name: "Mangueira",
    description: "Bairro com risco de enchentes no Rio de Janeiro, especialmente durante a temporada de chuvas. A comunidade enfrenta problemas recorrentes de saneamento inadequado e inundações.",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Turano",
    description: "Área de risco na Zona Norte do Rio de Janeiro, conhecida por conflitos armados entre facções e a polícia. É um local de alta vulnerabilidade social e falta de infraestrutura.",
    risk: rand(1..5),
    city: rio_de_janeiro
  },
  {
    name: "Manguinhos",
    description: "Favela com histórico de problemas de infraestrutura, como falta de água e esgoto adequados. A violência é uma preocupação constante, e há uma presença significativa de atividades criminosas.",
    risk: rand(1..5),
    city: rio_de_janeiro
  }
]

danger_areas.each do |danger_area|
  da = DangerArea.new(danger_area)
  da.save!
end

# Seed Reviews
User.all.each do |user|
  50.times do |i|
    rate = rand(1..5)
    if rate >= 4
      title = good_review_titles[i % good_review_titles.size]
      comment = good_review_comments[i % good_review_comments.size]
    else
      title = bad_review_titles[i % bad_review_titles.size]
      comment = bad_review_comments[i % bad_review_comments.size]
    end

    Review.create!(
      title: title,
      rate: rate,
      comment: comment,
      user: user,
      city: created_cities.sample  # Use city: rather than city_id: Rails understands the association
    )
  end
end

puts "Seed completed!"
