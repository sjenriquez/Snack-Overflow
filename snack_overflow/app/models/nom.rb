class Nom < ActiveRecord::Base

  include Scoring

  belongs_to :user

  has_many :nom_tags
  has_many :tags, through: :nom_tags

  has_many :comments

  has_many :votes, as: :votable

  validates :title, presence: true
  validates :review, presence: true
  validates :pic_url, presence: true
  # validates :user_id, presence: true

end
