class Tag < ActiveRecord::Base
  has_many :nom_tags
  has_many :noms, through: :nom_tags
end
