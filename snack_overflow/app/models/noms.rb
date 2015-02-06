class Post < ActiveRecord::Base
  has_many :tags
  has_many :tags, through :nom_tags

  has_many :comments

  belongs_to :user

  has_many :votes, as: :votable

end
