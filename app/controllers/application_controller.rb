class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  set :public_folder, File.dirname(__FILE__) + '/static'

  get '/' do
    erb :index
  end

  get '/tweets' do
    @tweets = Tweet.all
    erb :'/tweets/index'
  end

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  get '/tweets/new' do
    erb :'/tweets/new'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/tweets' do 
     @tweet = Tweet.create(params[:tweet])
    if !params["user"]["name"].empty?
      @tweet.user = User.create(name: params["user"]["name"])
    end
    @tweet.save
    redirect to "users/#{@user.id}"
  end

  post '/users' do 
    @user = User.create(params[:user])
    if !params["tweet"]["content"].empty?
      @user.tweets << Tweet.create(content: params["tweet"]["content"])
    end
    @user.save
    redirect to "users/#{@user.id}"
  end

  get '/tweets/:id/edit' do 
    @tweets = Tweet.find(params[:id])
    erb :'/tweets/edit'
  end

  get '/users/:id/edit' do 
    @users = User.find(params[:id])
    erb :'/users/edit'
  end

  get '/tweets/:id' do 
    @tweet = Tweet.find(params[:id])
    erb :'/tweets/show'
  end

  get '/users/:id' do 
    @user = User.find(params[:id])
    erb :'/users/show'
  end

   post '/tweets/:id' do 
    @tweet = Tweet.find(params[:id])
    @tweet.update(params["tweet"])
    if !params["user"]["name"].empty?
      @tweet.user = User.create(name: params["user"]["name"])
    end
    @tweet.save
    redirect to "tweets/#{@tweet.id}"
  end

   post '/users/:id' do 
    @user = User.find(params[:id])
    @user.update(params["user"])
    if !params["user"]["name"].empty?
      @user.tweets << Tweet.create(content: params["tweet"]["content"])
    end
    @user.save
    redirect to "users/#{@user.id}"
  end


  



end