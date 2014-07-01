class PostsController < ApplicationController

  get '/' do #index
    # what data does this need?
    @posts = Post.all
    erb :"posts/index"
  end

  get '/posts/new' do
    @post = Post.new

    erb :"posts/new"
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :"posts/show"
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :"posts/edit"
  end

  patch '/posts/:id' do
    raise params.inspect
  end

  post '/posts' do
    @post = Post.new(params[:post])
    if @post.save 
      redirect to("/posts/#{@post.id}")
    else

      erb :"posts/new"
    end
  end


end