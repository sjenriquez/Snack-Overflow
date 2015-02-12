class Comment < ActiveRecord::Base

  include Scoring

  belongs_to :user

  belongs_to :nom

  has_many :votes, as: :votable

  validates :body, presence: true
  # Why is this commented out, seems like something we might need to be sure
  # of?
  # validates :post_id, presence: true
  # validates :user_id, presence: true

end
