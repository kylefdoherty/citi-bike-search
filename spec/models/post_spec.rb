require_relative '../spec_helper' 

describe Post do

  context 'with authors' do
    it 'allows authors to be assigned to a post' do
      ben = Author.new(:name => "Ben")
      post = Post.new(:title => "Valid")
      post.author = ben
      post.save

      expect(Post.find_by(:title => "Valid").author.name).to eq("Ben")
    end

    it 'includes the post within the authors posts collection' do
      ben = Author.new(:name => "Ben")
      post = Post.new(:title => "Valid")
      post.author = ben
      post.save

      expect(ben.posts).to include(post)
    end

    it 'allows an existing author to be assigned by name' do
      ben = Author.create(:name => "Ben")
      post = Post.new(:title => "valid")

      post.author_name = "Ben"
      post.save

      expect(post.author).to eq(ben)
    end

    it 'allows a new author to be assigned by name' do
      post = Post.new(:title => "Valid")
      post.author_name = "Brand New"
      post.save
      
      expect(Author.find_by(:name => "Brand New")).to be_persisted
    end
  end
end