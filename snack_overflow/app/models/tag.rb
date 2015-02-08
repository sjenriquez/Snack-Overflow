class Tag < ActiveRecord::Base
  belongs_to :user
  has_many :noms, through: :nom_tags
  has_many :nom_tags

  def self.all_tags
    self.all.map {|t| t.name}
  end

  def self.tags_for_select
    self.all_tags.map {|a| [a,a]}
  end
end
