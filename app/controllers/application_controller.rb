class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  # set :public_folder, File.dirname(__FILE__) + '/static'

  get '/' do
    erb :index
  end

  get '/mottos' do
    @mottos = Motto.all
    erb :'/mottos/index'
  end

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  get '/mottos/new' do
    erb :'/mottos/new'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/mottos' do 
     @motto = Motto.create(params[:motto])
    if !params["user"]["name"].empty?
      @motto.user = User.create(name: params["user"]["name"])
    end
    @motto.save
    redirect to "mottos/#{@motto.id}"
  end

  post '/users' do 
    @user = User.create(params[:user])
    if !params["motto"]["content"].empty?
      @user.mottos << Motto.create(content: params["motto"]["content"])
    end
    @user.save
    redirect to "users/#{@user.id}"
  end

  get '/mottos/:id/edit' do 
    @motto = Motto.find(params[:id])
    erb :'/mottos/edit'
  end

  get '/users/:id/edit' do 
    @user = User.find(params[:id])
    erb :'/users/edit'
  end

  get '/mottos/:id' do 
    @motto = Motto.find(params[:id])
    erb :'/mottos/show'
  end

  get '/users/:id' do 
    @user = User.find(params[:id])
    erb :'/users/show'
  end

   post '/mottos/:id' do 
    @motto = Motto.find(params[:id])
    @motto.update(params["motto"])
    if !params["user"]["name"].empty?
      @motto.user = User.create(name: params["user"]["name"])
    end
    @motto.save
    redirect to "/mottos/#{@motto.id}"
  end

   post '/users/:id' do 
    @user = User.find(params[:id])
    @user.update(params["user"])
    if !params["user"]["name"].empty?
      @user.mottos << Motto.create(content: params["motto"]["content"])
    end
    @user.save
    redirect to "/users/#{@user.id}"
  end


  get '/mottos/:id/delete' do
    @motto = Motto.find(@params[:id])
    erb :'/mottos/show'
  end

  get '/users/:id/delete' do
    @user = User.find(@params[:id])
    erb :'/users/show'
  end

  post '/mottos/:id/delete' do
    @motto = Motto.find(params[:id]).destroy
    redirect '/mottos'
  end

  post '/users/:id/delete' do
    @user = User.find(params[:id]).destroy
    redirect '/users'
  end


  



end