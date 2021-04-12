# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@studio_1 = Studio.create!(name: 'Universal Studios', location: 'Orlando, FL')
@studio_2 = Studio.create!(name: 'Paramount', location: 'Somewhere, USA')

@movie_1 = @studio_1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
@movie_2 = @studio_2.movies.create!(title: 'Movie Name', creation_year: 2021, genre: 'Nobody/Knows')

@actor_1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: false)
@actor_2 = Actor.create!(name: 'Dudebro', age: 21, currently_working: true)

ActorMovie.create!(actor: @actor_1, movie: @movie_1)
ActorMovie.create!(actor: @actor_2, movie: @movie_2)
