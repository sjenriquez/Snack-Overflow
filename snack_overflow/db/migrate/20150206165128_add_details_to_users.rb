class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :pic_url, :string
    add_column :users, :brownie_points, :integer
    add_column :users, :bio, :text
    add_column :users, :website_url, :string
    add_column :users, :name, :string
  end
end
