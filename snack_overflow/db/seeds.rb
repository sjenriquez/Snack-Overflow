12.times {
  User.create(username: Faker::Name.name, password: "password")
}

25.times {
  votable_type_arr = ["comment", "nom"].sample
  decision_arr = [1, -1].sample
  Nom.create(user_id: rand(1..12), title: Faker::Lorem.sentence, review: Faker::Lorem.paragraph)
  Comment.create(user_id: rand(1..12), post_id: rand(1..25), body: Faker::Lorem.paragraph, parent_id: nil)
  Vote.create(votable_id: rand(1..12), votable_type: votable_type_arr, decision: decision_arr)
}
