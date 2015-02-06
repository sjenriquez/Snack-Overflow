class Comment < ActiveRecord::Base
  belongs_to :user

  belongs_to :nom

  has_many :replies, foreign_key: :parent_id, class_name: "Comment"
  belongs_to :parent, foreign_key: :parent_id, class_name: "Comment"
end
