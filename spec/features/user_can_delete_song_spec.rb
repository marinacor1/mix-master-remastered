require 'rails_helper'

RSpec.feature "user can delete song" do
  scenario "delete song and be redirected" do
    artist = create(:artist)
    song = artist.songs.create(title: "hiya")

    visit artist_song_path(artist, song)
    
    click_on "Delete"

    expect(current_path).to eq(artist_songs_path(artist))
    expect(page).to_not have_content("#{song.title}")
  end
end
