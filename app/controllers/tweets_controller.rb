# class TweetsController < ApplicationController

#   get '/tweets' do
#     @tweets = Tweet.all
#     erb :'/tweets/index'
#   end

#   get '/tweets/new' do
#     erb :'/tweets/new'
#   end

#   post '/tweets' do 
#      @tweet = Tweet.create(params[:tweet])
#     if !params["user"]["name"].empty?
#       @tweet.user = User.create(name: params["user"]["name"])
#     end
#     @user.save
#     redirect to "users/#{@user.id}"
#   end

#   get '/tweets/:id/edit' do 
#     @tweet = Tweet.find(params[:id])
#     erb :'/tweets/edit'
#   end

#   get '/tweets/:id' do 
#     @tweet = Tweet.find(params[:id])
#     erb :'/tweets/show'
#   end

#    post '/tweets/:id' do 
#     @tweet = Tweet.find(params[:id])
#     @tweet.update(params["tweet"])
#     if !params["user"]["name"].empty?
#       @tweet.user = User.create(name: params["user"]["name"])
#     end
#     @tweet.save
#     redirect to "tweets/#{@tweet.id}"
#   end
# end

# end