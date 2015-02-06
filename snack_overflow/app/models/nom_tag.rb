class NomTag < ActiveRecord::Base
  belongs_to :nom
  belongs_to :tag
end
