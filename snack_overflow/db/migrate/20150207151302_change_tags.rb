class ChangeTags < ActiveRecord::Migration
  def change
    change_table :tags do |t|
      t.remove :post_id
      t.references :tagable, polymorphic: true, index: true

    end
  end
end
