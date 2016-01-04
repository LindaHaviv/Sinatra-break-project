
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
Motto.create(content: "Flatiron School rocks", user: linda)



