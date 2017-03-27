require 'rails_helper'

RSpec.feature "user edits an artist" do
  scenario "they edit an artist" do
    abba = Artist.create(name: "Xela", image_path: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/06/06/13/abba.jpg")

    visit artist_path(abba)
    click_on "Edit"
    fill_in "Name", with: "ABBA"
    click_on "Update Artist"
save_and_open_page
    expect(page).to have_content "ABBA"
    expect(page).to_not have_content "Xela"
    expect(page).to have_css("img[src=\"#{abba.image_path}\"]")
  end
end
