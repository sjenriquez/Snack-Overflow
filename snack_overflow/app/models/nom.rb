class Nom < ActiveRecord::Base
  belongs_to :user

  has_many :nom_tags
  has_many :tags, through: :nom_tags

  has_many :comments

  has_many :votes, as: :votable

  validates :title, presence: true
  validates :review, presence: true
  validates :pic_url, presence: true
  # validates :user_id, presence: true

  def upvote
    Vote.create(votable: self, decision: 1)
  end

  def downvote
    Vote.create(votable: self, decision: 0)
  end

  def upvotes
    self.votes.where(decision: 1)
  end

  def downvotes
    self.votes.where(decision: 0)
  end

  def score
    self.upvotes.count - self.downvotes.count
  end

end
