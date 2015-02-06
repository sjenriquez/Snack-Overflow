FactoryGirl.define do
  factory :comment do
    body "I freaking love this snack"
    parent_id nil
    user_id 1
    nom_id 3


  end

  # factory :commenteds do
  #   content "I freaking love this snack more than you"
  #   child_id 1
  #   user_id 1
  #   nom_id 3
  # end

end
