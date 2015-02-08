module Scoring

	def upvote(user_id)
    Vote.create(votable: self, decision: 1, user_id: user_id)
  end

  def downvote(user_id)
    Vote.create(votable: self, decision: 0, user_id: user_id)
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