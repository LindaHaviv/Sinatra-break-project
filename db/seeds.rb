
# require 'faker'

# user_name = Faker::Name.name
# user_tweet = Faker::Lorem.sentence

# 10.times do 
#   user = User.create(name: user_name)
#   puts user.inspect
# end


# 10.times do
#   tweet = Tweet.create(content: user_tweet)
#   puts tweet.inspect
# end


linda = User.create(name:"Linda")
Tweet.create(content: "fake tweet", user: linda)
Tweet.create(content: "fake tweet 2", user: linda)


