module Scoring

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