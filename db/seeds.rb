require 'faker'
require 'open-uri'

puts 'Cleaning database...'
Movie.destroy_all
List.destroy_all

puts 'Creating movies...'
10.times do
  movie = Movie.create(title: Faker::Movie.title, overview: Faker::Movie.quote, poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: rand(4.0...10.0).round(1))
  puts "Created #{movie.title}"
end

puts 'Creating lists...'
List.create(name: "Classic")
List.create(name: "Drama")
List.create(name: "Thriller")
List.create(name: "Comedy")
List.create(name: "Action")

puts 'Finished!'
