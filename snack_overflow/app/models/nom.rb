class Nom < ActiveRecord::Base

  include Scoring

  belongs_to :user

  has_many :nom_tags
  has_many :tags, through: :nom_tags

  has_many :comments

  has_many :votes, as: :votable
  has_many :tags, as: :tagable

  validates :title, presence: true
  validates :review, presence: true
  validates :pic_url, presence: true
  # validates :user_id, presence: true


  def self.vend_ten
    Nom.where('created_at >= ?', 1.week.ago).sort_by(&:score).reverse.take(10)
  end

  def self.rand_nom
    @nom = Nom.all.sample
  end

  def self.most_popular
    Nom.all.sort_by(&:score).reverse.take(5)
  end

  def self.most_recent
    Nom.all.sort_by(&:created_at).reverse.take(5)
  end

end
