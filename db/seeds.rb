User.create!(email: "main@user.com",
             password: "mainmain")

4.times do |n|
  User.create!(email: "main_#{n+1}@user.com",
               password: "mainmain")
end


Article.create!(title: "This is the first entry",
                entry: Faker::Lorem.sentences(5),
                user_id: 1)

30.times do 
  Article.create!(title: Faker::Lorem.sentence,
                  entry: Faker::Lorem.sentences(50),
                  user_id: rand(1..5))
end

60.times do 
  Comment.create!(name: Faker::Name.name,
                  body: Faker::Lorem.sentences(6),
                  article_id: rand(16..31))
end