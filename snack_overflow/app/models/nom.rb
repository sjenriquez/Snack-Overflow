class Nom < ActiveRecord::Base
  belongs_to :user

  has_many :tags
  has_many :tags, through :nom_tags

  has_many :comments


  has_many :votes, as: :votable

  validates :title, presence: true
  validates :review, presence: true
  validates :user_id, presence: true
end
