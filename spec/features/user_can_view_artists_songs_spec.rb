require 'rails_helper'

RSpec.feature "view songs for artist" do
  scenario "user can view songs for a specific artist" do
    artist = create(:artist)
    song1 = artist.songs.create(title: "Hello")
    song2 = artist.songs.create(title: "Bye")

    visit artist_path(artist)
    click_on "View songs"

    expect(current_path).to eq(artist_songs_path(artist))
    expect(page).to have_content song1.title
    expect(page).to have_content song2.title
  end
end
