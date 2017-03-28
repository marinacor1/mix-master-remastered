require 'rails_helper'

RSpec.feature "edit song" do
  scenario "they can update tile" do
    artist = create(:artist)
    song = artist.songs.create(title: "Boom")

    visit song_path(song)
    click_on "Edit"
    fill_in "Title", with: "Shacka"
    click_on "Update Song"

    expect(page).to have_content "Shacka"
    expect(page).to_not have_content "Boom"
  end
end
