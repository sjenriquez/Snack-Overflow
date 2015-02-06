class User < ActiveRecord::Base

  has_many :noms
  has_many :comments
  has_many :votes, as: :votable



end
