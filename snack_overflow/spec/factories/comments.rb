FactoryGirl.define do
  # don't commit commented out stuff....delete it or use it..but don't leave
  # junk around.

  factory :comment do
    body "I freaking love this snack"
    user_id 1
    # nom_id 3
  end

  # factory :commenteds do
  #   content "I freaking love this snack more than you"
  #   child_id 1
  #   user_id 1
  #   nom_id 3
  # end

end
