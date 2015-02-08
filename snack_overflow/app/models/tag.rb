class Tag < ActiveRecord::Base
  belongs_to :user
  has_many :noms, through: :nom_tags
  has_many :nom_tags

  def self.all_tags
    self.all.map {|t| t.name}
  end

end
