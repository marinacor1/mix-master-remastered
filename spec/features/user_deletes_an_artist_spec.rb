require 'rails_helper'

RSpec.feature "user deletes an artist" do
  scenario "user deletes a specific artist" do
    phish = Artist.create(name: "Phish", image_path: "http://trey.com/wp-content/uploads/2012/12/phish1.jpg")

    visit artist_path(phish)
    click_on "Delete"

    expect(current_path).to eq(artists_path)
    expect(page).to_not have_content "Phish"
  end
end
