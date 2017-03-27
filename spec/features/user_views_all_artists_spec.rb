require 'rails_helper'

RSpec.feature "user views all artists" do
  scenario "user sees artist info with link" do
    artist1_name = "Michael Jackson"
    image_path1 = "http://img2.timeinc.net/people/i/2015/greatideas/blog/150907/michael-jackson-600x800.jpg"
    artist2_name = "The Shins"
    image_path2 = "https://cdn.pastemagazine.com/www/articles/2007/01/24/sleepless_with_the_shins_430x270.jpg"

    visit '/artists'
    click_on "New artist"
    fill_in "artist_name", with: artist1_name
    fill_in "artist_image_path", with: image_path1
    click_on "Create Artist"

    visit '/artists'
    click_on "New artist"
    fill_in "artist_name", with: artist2_name
    fill_in "artist_image_path", with: image_path2
    click_on "Create Artist"

    visit '/artists'
    expect(page).to have_content artist1_name
    expect(page).to have_content artist2_name
    expect(page).to have_css("img[src=\"#{image_path1}\"]")
    expect(page).to have_css("img[src=\"#{image_path2}\"]")

    click_on "#{artist1_name}"
    expect(page).to have_content artist1_name
    expect(page).to have_css("img[src=\"#{image_path1}\"]")

    visit '/artists'
    click_on "#{artist2_name}"
    expect(page).to have_content artist2_name
    expect(page).to have_css("img[src=\"#{image_path2}\"]")

  end
end
