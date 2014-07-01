require_relative '../spec_helper'

describe "reading blog posts", :type => :feature do
  before :each do
    @post = Post.create(:title => "Sample Post", :content => "Sample Content")
  end

  it "shows the blog posts on the homepage" do
    visit '/'

    expect(page).to have_link(@post.title, "/posts/#{@post.id}")    
  end

  it 'shows the posts content on the post show page' do
    visit "/posts/#{@post.id}"

    expect(page).to have_content @post.content
  end
end
