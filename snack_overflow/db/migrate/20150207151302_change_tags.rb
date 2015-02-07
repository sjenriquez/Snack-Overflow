class ChangeTags < ActiveRecord::Migration
  def change
    change_table :tags do |t|
      t.remove :post_id
      t.references :tagable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
