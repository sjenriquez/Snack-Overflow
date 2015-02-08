class NomTag < ActiveRecord::Base
  belongs_to :nom
  belongs_to :tag

  validates_uniqueness_of :nom_id, :scope => :tag_id
end
