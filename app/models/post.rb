class Post < ActiveRecord::Base
  validates :title, :presence => :truew
  belongs_to :author

  def author_name=(name)  
    self.author = Author.find_or_create_by(:name => name)
  end

  def author_name
    self.author ? self.author.name : "Anon"
  end
end