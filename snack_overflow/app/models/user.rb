class User < ActiveRecord::Base
  has_secure_password

  has_many :noms
  has_many :comments
  has_many :votes, as: :votable
  has_many :tags, as: :tagable

  # validates :username, presence: true, uniqueness: true
  # validates :password, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :name, presence: true

  def brownie_points
    all_noms = self.noms
    nom_score = 0
    all_noms.each do |nom|
      nom.votes.each do |vote|
        if vote.decision == 1
          nom_score += 1
        end
      end
    end

    all_comments = self.comments
    comment_score = 0
    all_comments.each do |comment|
      comment.votes.each do |vote|
        if vote.decision == 1
          comment_score += 1
        end
      end
    end
    return nom_score + comment_score
  end

  def upvoted
    Vote.where(votable_type: "Nom", decision: 1, user_id: self.id)
  end
end
