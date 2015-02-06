class CreateNomTags < ActiveRecord::Migration
  def change
    create_table :nom_tags do |t|
      t.integer :tag_id
      t.integer :nom_id
      t.timestamps null: false
    end
  end
end
