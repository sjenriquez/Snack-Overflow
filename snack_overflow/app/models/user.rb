class User < ActiveRecord::Base
  has_secure_password

  has_many :noms
  has_many :comments
  has_many :votes, as: :votable

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

end
