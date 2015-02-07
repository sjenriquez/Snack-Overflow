12.times {
  User.create(username: Faker::Name.name, password: "password", name: Faker::Name.name, email: Faker::Internet.email, pic_url: Faker::Avatar.image)
}

25.times {
  Nom.create(user_id: rand(1..12), title: Faker::Lorem.sentence, review: Faker::Lorem.paragraph, pic_url: Faker::Avatar.image)
  Comment.create(user_id: rand(1..12), nom_id: rand(1..25), body: Faker::Lorem.paragraph, parent_id: nil)
}

40.times {
  decision_arr = [1, 0]
  Vote.create(votable: Comment.find(rand(1..25)), decision: decision_arr.sample, user_id: rand(1..12))
  Vote.create(votable: Nom.find(rand(1..25)), decision: decision_arr.sample, user_id: rand(1..12))
}

tag_flavors = ["Sweet","Salty","Savory","Unami","Sour"]
tag_flavors.each{ |flavor| Tag.create(name: flavor) }
tag_types = ["User", "Nom"]

Tag.all.each do |tag|
  tag.tagable_id = rand(1..5)
  tag.tagable_type = tag_types.sample
end

