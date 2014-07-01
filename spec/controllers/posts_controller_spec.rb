require_relative '../spec_helper'

describe 'PostsController' do
  describe 'GET /posts/new' do
    before do
      get '/posts/new'
    end

    it 'responds with a 200' do
      expect(last_response).to be_ok
    end
  end

  describe 'POST /posts' do
    context 'with invalid post data' do
      before do
        post '/posts', {}
      end

      it 'displays validation errors' do
        expect(last_response.body).to include("Title can't be blank")
      end

      it 'does not redirect' do
        expect(last_response).to_not be_a_redirect
      end
    end

    context 'with valid post data' do
      before do
        post '/posts', {:post => {:title => "Hello World", :content => "Awesome", :author_name => "Ben"}}
      end

      it 'created that post in the db' do
        expect(Post.find_by(:title => "Hello World")).to be_persisted
      end

      it 'redirects' do
        expect(last_response).to be_a_redirect
      end

      it 'redirected to the post page' do
        expect(last_response.location).to match("/posts/#{Post.last.id}")
      end
    end
  end

end