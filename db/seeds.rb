require 'json'

puts 'Cleaning database...'
Movie.destroy_all
List.destroy_all

puts 'Creating movies...'

url = "http://tmdb.lewagon.com/movie/top_rated?api_key=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyN2Q5NmI3MmY3MmQ2NDI3ZTdiZDBhOTZlNjczMDI1OCIsInN1YiI6IjY0ZGY0NTEzZDEwMGI2MTRiNGNkNWZlZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.1z_wnYCUtpvcNVjqiyTayc8fT8z4-b_bPjLE5y7id1Q&language=en-US&page=1"
response = HTTParty.get(url)

movies = JSON.parse(response.body)["results"]

movies.each do |movie|
  movie = Movie.create!(title: movie["original_title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}", rating: movie["vote_average"])
  puts "Created #{movie.title}"
end

puts 'Creating lists...'

lists = ['Classic', 'Drama', 'Thriller', 'Comedy', 'Action']
lists.each { |list| List.create(name: list) }

puts 'Finished!'
