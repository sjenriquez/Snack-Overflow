class AddUrlColumnToNoms < ActiveRecord::Migration
  def change
    add_column :noms, :pic_url, :text
  end
end
