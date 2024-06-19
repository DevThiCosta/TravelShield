# db/seeds.rb
User.destroy_all
City.destroy_all
DangerArea.destroy_all
Review.destroy_all

cities_photos = "https://res.cloudinary.com/dkcetjel5/image/upload/v1716668402/fotoRioDeJaneiro_shnysb.jpg"

# Generate different city descriptions
cities_descriptions = [
  "Conhecida por suas belas praias e vida noturna vibrante, esta cidade é um dos destinos turísticos mais populares do Brasil.".ljust(100),
  "Com uma rica herança cultural e diversos pontos históricos, esta cidade oferece um mergulho na história do Brasil.".ljust(100),
  "Cidade turistica com grande importância econômica, conhecida por sua infraestrutura e desenvolvimento.".ljust(100),
  "Com um cenário deslumbrante de montanhas e florestas, esta cidade é perfeita para os amantes da natureza.".ljust(100),
  "Oferecendo uma mistura única de tradição e modernidade, esta cidade encanta seus visitantes com sua arquitetura e cultura.".ljust(100)
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
  "Transporte Público Excelente!", "Cidade Segura!", "Ótima Infraestrutura!", "Atrações Incríveis!", "Experiência Maravilhosa!",
  "Tudo Perfeito!", "Cidade Excepcional!", "Muito Confortável!", "Valorizou a Viagem", "Recomendo!",
  "Infraestrutura de Primeira!", "Amei a Cidade!", "Muito Acolhedora!", "Surpreendeu Positivamente!", "Localização Perfeita!",
  "Muito Limpa e Organizada!", "Cidade Encantadora!", "Vista Deslumbrante!", "Tudo Impecável!", "Hospedagem Confortável!",
  "Transporte Público Eficiente", "Local Muito Seguro!", "Muita Aconchegante!", "Valeu Cada Minuto!", "Cidade de Excelência!",
  "Sempre Acolhedora", "Atrações Imperdíveis!", "Segurança Total!", "Diversidade de Opções!", "Gastronomia Excelente!",
  "Cidade Charmosa!", "Estrutura Fantástica!", "Muito Tranquila!"
]

good_review_comments = [
  "Tive uma experiência incrível nesta cidade! O transporte público é pontual e eficiente, e todos foram muito acolhedores.",
  "A cidade é maravilhosa! A segurança é notável e me senti muito seguro durante toda a minha estadia.",
  "A infraestrutura é excelente. Sem dúvidas, recomendo a visita!",
  "As atrações turísticas são incríveis e há muito o que explorar!",
  "Foi uma experiência maravilhosa! A cidade tem tudo o que você precisa para uma ótima viagem.",
  "Cada detalhe da minha viagem foi perfeito! Obrigado pela hospitalidade.",
  "A cidade é excepcional! Muita coisa para ver e fazer.",
  "Muito confortável! A cidade é ideal para descansar e aproveitar.",
  "Minha viagem foi valorizada pela visita a esta cidade fantástica!",
  "Recomendo a cidade para todos. Ótima para visitar em qualquer ocasião.",
  "Excelente infraestrutura, não falta nada. Recomendadíssimo!",
  "Amei cada momento nesta cidade acolhedora e cheia de opções.",
  "A cidade tem um charme especial. Me senti muito bem recebido.",
  "Muito limpo, organizado e com uma paisagem de tirar o fôlego.",
  "Lugar encantador, exatamente o que eu esperava!",
  "A vista é deslumbrante e a localização é ótima para tudo.",
  "Impecável manutenção de parques e áreas públicas.",
  "Hospedagem confortável e muito bem localizada.",
  "Transporte público que funciona! Sem atraso e muito conveniente.",
  "Tudo muito seguro, ideal para famílias e crianças.",
  "Muito aconchegante, perfeito para relaxar.",
  "Valeu cada minuto! Cidade incrível e cheia de vida.",
  "Cidade de excelência em todos os aspectos.",
  "Sempre acolhedora e cheia de vida.",
  "Atrações imperdíveis em várias partes da cidade.",
  "Segurança total, o que me deixou muito tranquilo.",
  "Muita diversidade cultural e opções de lazer.",
  "A gastronomia é excelente, com muitas opções deliciosas.",
  "A cidade é cheia de charme e história.",
  "Estrutura fantástica para turistas.",
  "Muito tranquila, ideal para um bom descanso."
]

# Generate bad review titles and comments in Portuguese
bad_review_titles = [
  "Transporte Público Deficiente", "Cidade Insegura", "Infraestrutura Precária", "Atrações Decepcionantes", "Experiência Ruim",
  "Tudo Muito Caro", "Cidade Desorganizada", "Desconfortável", "Não é uma Boa Cidade", "Não Recomendo",
  "Infraestrutura Inadequada", "Não Gostei da Visita", "Muito Desleixada", "Poderia Ser Melhor", "Localização Ruim",
  "Cidade Suja", "Atrações Limitadas", "Vista Decepcionante", "Nada de Especial", "Hospedagem Ruim",
  "Transporte Público Ineficiente", "Local Muito Perigoso", "Nada Confortável", "Perdi Meu Tempo", "Cidade Decepcionante",
  "Desorganizada e Suja", "Poucas Atrações", "Muita Insegurança", "Pouca Diversidade", "Gastronomia Ruim",
  "Cidade Sem Graça", "Estrutura Deficiente", "Muito Barulhenta"
]

bad_review_comments = [
  "Infelizmente, minha experiência não foi boa. O transporte público é péssimo e demorado.",
  "A segurança deixa muito a desejar. Não me senti seguro em nenhum momento.",
  "Achei a infraestrutura precária. Muitas áreas precisam de reforma.",
  "As atrações turísticas são decepcionantes. Esperava mais.",
  "Minha experiência foi ruim. Nada do que esperei.",
  "Tudo muito caro comparado a outras cidades.",
  "Cidade desorganizada e com muitos problemas.",
  "Não foi confortável. A cidade precisa melhorar muito.",
  "Não é uma cidade boa para visitar. Muita coisa para melhorar.",
  "Não recomendo. Há lugares melhores para visitar.",
  "Achei a infraestrutura muito inadequada para turistas.",
  "Não gostei da visita. Muitos problemas e poucas soluções.",
  "Muito desleixada e mal cuidada.",
  "Poderia ser melhor com algumas melhorias.",
  "Localização ruim, difícil acesso às principais áreas.",
  "Cidade suja e mal cuidada.",
  "Atrações limitadas e pouco interessantes.",
  "Vista decepcionante. Esperava mais da paisagem.",
  "Nada de especial nesta cidade.",
  "Hospedagem ruim e desconfortável.",
  "Transporte público ineficiente e sempre atrasado.",
  "Local muito perigoso, não me senti seguro.",
  "Nada confortável na cidade.",
  "Perdi meu tempo visitando. Nada proveitoso.",
  "Cidade decepcionante em vários aspectos.",
  "Desorganizada e suja, precisa de muitas melhorias.",
  "Poucas atrações turísticas.",
  "Muita insegurança nas ruas.",
  "Pouca diversidade cultural.",
  "Gastronomia ruim e poucas opções de qualidade.",
  "Cidade sem graça e sem atrativos.",
  "Estrutura deficiente para receber turistas.",
  "Muito barulhenta, difícil descansar."
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
danger_areas = [
  {
    name: "Complexo do Alemão",
    description: "Complexo de favelas localizado na Zona Norte do Rio de Janeiro. É uma área de alta criminalidade, com frequentes confrontos entre facções e a polícia. Possui um alto índice de tráfico de drogas e as condições de vida são precárias.",
    risk: rand(1..5),
    city_name: "Rio de Janeiro"
  },
  {
    name: "Cidade de Deus",
    description: "Favela localizada na Zona Oeste do Rio de Janeiro, conhecida pelo filme homônimo. A área sofre com a violência relacionada ao tráfico de drogas e apresenta carências em infraestrutura básica e saneamento.",
    risk: rand(1..5),
    city_name: "Rio de Janeiro"
  },
  {
    name: "Rocinha",
    description: "Favela localizada na Zona Sul do Rio de Janeiro, é uma das maiores da América Latina. Apesar de ser um ponto turístico, a Rocinha enfrenta problemas graves de segurança, com incidência de tráfico de drogas e conflitos armados.",
    risk: rand(1..5),
    city_name: "Rio de Janeiro"
  },
  {
    name: "Jacarezinho",
    description: "Favela localizada na Zona Norte do Rio de Janeiro, tem histórico de confrontos violentos entre traficantes e forças de segurança. As condições de vida dos moradores são complicadas, com falta de serviços básicos.",
    risk: rand(1..5),
    city_name: "Rio de Janeiro"
  },
  {
    name: "Santa Marta",
    description: "Favela localizada na Zona Sul do Rio de Janeiro, conhecida por projetos sociais e iniciativas de pacificação. No entanto, ainda enfrenta desafios de segurança, principalmente relacionados ao tráfico de drogas.",
    risk: rand(1..5),
    city_name: "Rio de Janeiro"
  },
  {
    name: "Vila Cruzeiro",
    description: "Favela localizada na Zona Norte do Rio de Janeiro, notória por tiroteios e conflitos entre facções criminosas. A área apresenta dificuldades significativas em termos de infraestrutura e segurança.",
    risk: rand(1..5),
    city_name: "Rio de Janeiro"
  },
  {
    name: "Bongaba",
    description: "Área em Magé com histórico de alagamentos frequentes, o que representa um risco para os moradores. Os problemas de infraestrutura e a falta de serviços básicos agravam a situação da região.",
    risk: rand(1..5),
    city_name: "Magé"
  },
  {
    name: "Mangueira",
    description: "Bairro com risco de enchentes no Rio de Janeiro, especialmente durante a temporada de chuvas. A comunidade enfrenta problemas recorrentes de saneamento inadequado e inundações.",
    risk: rand(1..5),
    city_name: "Rio de Janeiro"
  },
  {
    name: "Turano",
    description: "Área de risco na Zona Norte do Rio de Janeiro, conhecida por conflitos armados entre facções e a polícia. É um local de alta vulnerabilidade social e falta de infraestrutura.",
    risk: rand(1..5),
    city_name: "Rio de Janeiro"
  },
  {
    name: "Manguinhos",
    description: "Favela com histórico de problemas de infraestrutura, como falta de água e esgoto adequados. A violência é uma preocupação constante, e há uma presença significativa de atividades criminosas.",
    risk: rand(1..5),
    city_name: "Rio de Janeiro"
  },
  {
    name: "Morro do Cavalão",
    description: "Área de alta periculosidade localizada em Niterói, conhecida pelos conflitos entre facções criminosas e a polícia.",
    risk: rand(1..5),
    city_name: "Niterói"
  },
  {
    name: "Complexo do Salgueiro",
    description: "Localizado em São Gonçalo, frequentes confrontos entre traficantes e polícia, alto risco para visitantes.",
    risk: rand(1..5),
    city_name: "São Gonçalo"
  },
  {
    name: "Gardênia Azul",
    description: "Área em Duque de Caxias que sofre com elevados índices de criminalidade e disputa de território entre facções.",
    risk: rand(1..5),
    city_name: "Duque de Caxias"
  },
  {
    name: "Caramujo",
    description: "Distrito em Niterói identificado por elevados níveis de violência e confrontos armados.",
    risk: rand(1..5),
    city_name: "Niterói"
  },
  {
    name: "Itambi",
    description: "Área perigosa em Itaboraí, região metropolitana do Rio, marcada por violência urbana.",
    risk: rand(1..5),
    city_name: "Itaboraí"
  },
  {
    name: "Comunidade do Brejal",
    description: "Localizada em Campos dos Goytacazes, essa região têm sérios problemas de violência e tráfico de drogas.",
    risk: rand(1..5),
    city_name: "Campos dos Goytacazes"
  }
]

# Associando as cidades às suas áreas de risco
danger_areas.each do |danger_area|
  city = City.find_by(name: danger_area.delete(:city_name)) # Remove a chave city_name e busca a cidade
  next unless city

  DangerArea.create!(danger_area.merge(city: city))
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
