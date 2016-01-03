
# class UsersController < ApplicationController

#   get '/users' do
#     @users = User.all
#     erb :'/users/index'
#   end

#   get '/users/new' do
#     erb :'/users/new'
#   end

#   post '/users' do 
#     @user = User.create(params[:user])
#     if !params["tweet"]["content"].empty?
#       @user.tweets << Tweet.create(content: params["tweet"]["content"])
#     end
#     @user.save
#     redirect to "users/#{@user.id}"
#   end

#   get '/users/:id/edit' do 
#     @users = User.find(params[:id])
#     erb :'/users/edit'
#   end

#   get '/users/:id' do 
#     @user = User.find(params[:id])
#     erb :'/users/show'
#   end

#    post '/users/:id' do 
#     @user = User.find(params[:id])
#     @user.update(params["user"])
#     if !params["user"]["name"].empty?
#       @user.tweets << Tweet.create(content: params["tweet"]["content"])
#     end
#     redirect to "users/#{@user.id}"
#   end

# end