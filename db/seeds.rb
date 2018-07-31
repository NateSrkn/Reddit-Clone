# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'random_data'

users = User.all
post = Post.all 
sponsored_post = SponsoredPost.all
question = Question.all
topics = Topic.all


5.times do 
    User.create!(
        name: RandomData.random_name,
        email: RandomData.random_email,
        password: RandomData.random_sentence
    )
end

15.times do 
    Topic.create!(
        name: RandomData.random_sentence,
        description: RandomData.random_paragraph
    )
end

50.times do
    # create! creates Posts that raise an error with !
    s_post = Post.create!(
        # RandomData will create random strings.
        user: users.sample,
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )

    s_post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
    rand(1..5).times { s_post.votes.create!(value: [-1, 1].sample, user: users.sample)}
end

100.times do 

    Comment.create!(
        user: users.sample,
        post: post.sample, # picks a random post to comment on
        body: RandomData.random_paragraph
    )
end

50.times do 
    SponsoredPost.create!(
        topic: topics.sample,
        title: "Sponsored",
        body: RandomData.random_paragraph,
        price: rand(100...500)
    )
end

10.times do
    Question.create!(
        title: RandomData.random_word,
        body: RandomData.random_sentence
    )
end


Post.find_or_create_by(
    title: 'Unique Title',
    body: 'Unique Body'
)

Comment.find_or_create_by(
    post: post.find_by(body: 'Unique Body'),
    body: 'Unique Comment'
)

admin = User.create!(
    name: 'Admin User',
    email: 'Admin@email.com',
    password: 'password',
    role: 'admin'
)

member = User.create!(
    name: 'Member User',
    email: 'Member@email.com',
    password: 'password'
)

moderator = User.create!(
    name: 'Moderator User',
    email: 'Moderator@email.com',
    password: 'password',
    role: 'moderator'
)

puts "Seed finished"
puts "#{User.count} users created" 
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Vote.count} votes created"


