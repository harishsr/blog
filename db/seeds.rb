Article.create!(title: "This is the first entry",
                entry: Faker::Lorem.sentences(5))

30.times do 
  Article.create!(title: Faker::Lorem.sentence,
                  entry: Faker::Lorem.sentences(50))
end