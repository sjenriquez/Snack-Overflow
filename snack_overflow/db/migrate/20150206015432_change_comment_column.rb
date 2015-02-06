class ChangeCommentColumn < ActiveRecord::Migration
  def change
    rename_column :comments, :post_id, :nom_id
  end
end
