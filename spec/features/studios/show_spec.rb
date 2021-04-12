require 'rails_helper'

RSpec.describe 'studio show page', type: :feature do 

  before :each do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Orlando, FL')
    @studio_2 = Studio.create!(name: 'Paramount', location: 'Somewhere, USA')
    
    @movie_1 = @studio_1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @movie_2 = @studio_2.movies.create!(title: 'Movie Name', creation_year: 2021, genre: 'Nobody/Knows')
        
    @actor_1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: false)
    @actor_2 = Actor.create!(name: 'Dudebro', age: 21, currently_working: true)
    
    ActorMovie.create!(actor: @actor_1, movie: @movie_1)
    ActorMovie.create!(actor: @actor_2, movie: @movie_2)
  end

  it 'shows studios and its movies' do
    # Story 1
    # Studio Show
 
    # As a user,
    # When I visit a studio show page
    # I see the studio's name and location
    # And I see the titles of all of its movies
    visit '/studios'
    
    # within("studio-#{@studio_1.id}") do
      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)
      # expect(page).to have_content(@actor_1.name)
    # end

    # within("studio-#{@studio_2.id}") do
      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@studio_2.location)
      # expect(page).to have_content(@actor_2.name)
    # end
  end
end