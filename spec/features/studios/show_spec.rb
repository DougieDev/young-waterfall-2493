require 'rails_helper'

RSpec.describe 'studio show page', type: :feature do 

  before :each do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Orlando')

    @movie_1 = @studio_1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'action/adventure')

    @actor_1 = Actor.create!(name: 'Harrison Ford', age: 78, currently_working: false)

    ActorMovie.create!(actor: @actor_1, movie: @movie_1)
  end

  it 'shows studios and its movies' do
    # Story 1
    # Studio Show
 
    # As a user,
    # When I visit a studio show page
    # I see the studio's name and location
    # And I see the titles of all of its movies
    visit '/studios'
    within("studio-#{@studio_1.id}") do
      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)
    end
  end
end