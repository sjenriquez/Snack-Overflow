FactoryGirl.define do
  factory :comments do
    content "I freaking love this snack"
    child_id
    user_id 1
    nom_id 3
  end

  factory :commenteds do
    content "I freaking love this snack more than you"
    child_id 1
    user_id 1
    nom_id 3
  end

end
