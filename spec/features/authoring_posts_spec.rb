require_relative '../spec_helper'

describe "authoring a blog post", :type => :feature do

  it 'allows you to type in your author name when you create a post' do
    visit '/posts/new'

    fill_in 'Title', :with => "Hello World!"
    fill_in "Content", :with => "USA USA"

    fill_in "Author", :with => "Ben"

    click_button "Create Post"
    
    expect(page).to have_content "Hello World!"
    expect(page).to have_content "USA USA"
    expect(page).to have_content "By: Ben"
  end

  # but we'd like to test the page URL to make sure it's on the right page
  # check if the title is equal to the title
  # check if the author is equal to the author
  # check if the content is equal to the content

end