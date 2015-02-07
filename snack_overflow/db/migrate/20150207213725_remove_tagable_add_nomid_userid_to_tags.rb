class RemoveTagableAddNomidUseridToTags < ActiveRecord::Migration
  def change
    change_table :tags do |t|
      t.remove :tagable_id
      t.remove :tagable_type
      t.integer :user_id
    end
  end
end
