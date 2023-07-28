# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#User.create(email:"mataderoestadio@gmail.com", password:"123456")
User.create(email:"fumacarne@gmail.com", password:"123456")
40.times do 
    User.create(email:Faker::Internet.email, password:"123456")
end
80.times do 
    Article.create(photo:"photo cat ''  ^..^ '' ",description:Faker::Lorem.paragraph, user_id:Random.rand(1..40))
end

120.times do
    Comment.create(content:Faker::Lorem.paragraph,article_id:Random.rand(1..79),user_id:Random.rand(1..40))


end