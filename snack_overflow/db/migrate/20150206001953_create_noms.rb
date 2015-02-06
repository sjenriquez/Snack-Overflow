class CreateNoms < ActiveRecord::Migration
  def change
    create_table :noms do |t|
      t.string :title
      t.text :review
      t.integer :user_id
    end
  end
end
