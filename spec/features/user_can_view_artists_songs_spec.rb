require 'rails_helper'

RSpec.feature "view songs for artist" do
  scenario "user can view songs for a specific artist" do
    artist = create(:artist)
    song1 = artist.songs.create(title: "Wild Wild West")
    song2 = artist.songs.create(title: "Hello")
    song3 = artist.songs.create(title: "Bye")

    visit artist_path(artist)
    click_on "View songs"

    expect(current_path).to eq(artist_songs_path(artist))
    expect(page).to have_content song2.title
    expect(page).to have_content song1.title
    expect(page).to have_content song3.title
    #TODO expect(page).to have_css("ul:last_child", "#{song1.title}")

    #test for alphabetical songs
  end

end
