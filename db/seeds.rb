require "json"
require 'open-uri'


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


count = 0
url = "https://tmdb.lewagon.com/movie/top_rated"


5.times {

  file = URI.open(url).read
  data_hash = JSON.parse(file)
  parsing = data_hash["results"]


  title = parsing[count += 1]["original_title"]

  overview = parsing[count += 1]["overview"]
  poster_url = "https://image.tmdb.org/t/p/w500/#{parsing[count += 1]["poster_path"]}"

  Movie.create(title: title, overview: overview, poster_url: poster_url)
}
