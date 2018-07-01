# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


AdminUser.create!(email: 'admin@mp.com', password: '123456', password_confirmation: '123456') if Rails.env.development?

puts('Admin Created')
# genres = Tmdb::Genre.movie_list
# genres.each do |genre|
#   Tag.create(id: genre.id,value: genre.name)
# end
# n = rand(100)
# n.times do |i|
#   User.create(email: "user#{i}@mp.com", password: '123456', password_confirmation: '123456')
# end


ids = [337167, 269149, 284054, 354912, 181808, 338970, 284053, 300668, 268896, 399055, 141052, 321612, 347882, 198663, 24428, 499772, 335984, 353616, 460793, 353486]
g_ids = []

roles = ["Director", "Actor", "Writer"]
puts('Fetched movies')
roles.each do |role|
  Role.create(name: role)
end
puts("Extracted ids #{ids}")

t = rand(10..50)

t.times do |i|
  tech = Technician.create(name: "#{Faker::Name.first_name} #{Faker::Name.last_name}", email: "tech#{i}@gmail.com")
end
puts('Created technicians')

ids.each do |id|
  genre_ids = []
  company_ids = []
  movie = Tmdb::Movie.detail(id)
  genres = movie.genres
  puts(genres)
  companies = movie.production_companies
  puts(companies)
  genres.each do |genre|
    genre_ids << genre.id
    gn = Tag.find_or_create_by(id: genre.id, value: genre.name)
    puts("TAGS = #{gn.id}, #{gn.value} :: #{genre.id}, #{genre.name}" )
  end

  companies.each do |company|
    company_ids << company.id
    Company.find_or_create_by(id: company.id, name: company.name)
  end
  m = Movie.new(title: movie.original_title, poster_path: movie.poster_path, backdrop_path: movie.backdrop_path,
  budget: movie.budget, homepage: movie.homepage, language: movie.language, overview: movie.overview, release_date: movie.release_date,
  revenue: movie.revenue, runtime: movie.runtime, status: movie.status, tagline: movie.tagline)

  m.save

  m.companies = Company.find(company_ids)

  m.tags = Tag.find(genre_ids)
  mt = MovieTechnician.new(movie: m, technician: Technician.find(rand(t-1)+1), role: Role.find(1))
  mt.save
  mt = MovieTechnician.new(movie: m, technician: Technician.find(rand(t-1)+1), role: Role.find(2))
  mt.save
  mt = MovieTechnician.new(movie: m, technician: Technician.find(rand(t-1)+1), role: Role.find(3))
  mt.save
end

Technician.all.each do |technician|
  m = Role.all.count
  rand(1..m).times do |i|
    technician.roles<<Role.find(rand(1..m))
    technician.save
  end
end

t = rand(10..50)

t.times do |i|
  tech = User.create(name: "#{Faker::Name.first_name} #{Faker::Name.last_name}", email: "user#{i}@gmail.com",
                           password: '123456', password_confirmation: '123456')
end

puts('User Created')

t = User.all.count

rand(5..t).times do |i|
  puts(i)
  rand(i..t).times do |j|
    User.find(i+1).follow(User.find(j+1))
  end
end