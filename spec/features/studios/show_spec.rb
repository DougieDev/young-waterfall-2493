require 'rails_helper'

RSpec.describe 'studio show page', type: :feature do 

  before :each do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Orlando, FL')
    @studio_2 = Studio.create!(name: 'Paramount', location: 'Somewhere, USA')
    
    @movie_1 = @studio_1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @movie_2 = @studio_2.movies.create!(title: 'Movie Name', creation_year: 2021, genre: 'Nobody/Knows')
        
    @actor_1 = @movie_1.actors.create!(name: 'Harrison Ford', age: 78, currently_working: false)
    @actor_2 = @movie_2.actors.create!(name: 'Dudebro', age: 21, currently_working: true)
  end

  it 'shows studios and its movies' do
    # Story 1
    # Studio Show
 
    # As a user,
    # When I visit a studio show page
    # I see the studio's name and location
    # And I see the titles of all of its movies
    visit "/studios/#{@studio_1.id}"
    
    within("#studio-#{@studio_1.id}") do
      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)
    end

    within("#studio-#{@studio_2.id}") do
      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@studio_2.location)
    end
  end

  it 'shows actors for movies' do
    # Story 2
    # Studio's Actors

    # As a user,
    # When I visit a studio show page
    # I see a list of actors that have acted in any of the studio's movies
    # And I see that the list of actors is unique (no duplicate actors)
    # And I see that the list of actors is ordered from oldest actor to youngest
    # And I see that the list of actors only includes actors that are currently working

    # visit "/studios/#{@studio_1.id}"

    # expect(page).to have_content(@studio_1.name)
    # expect(page).to have_content(@studio_1.location)
    # expect(page).to have_content(@movie_1.title)
  end
end