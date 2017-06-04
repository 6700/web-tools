class AddUidAndAvatarUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :github_id, :string
    add_column :users, :avatar_url, :string
  end
end
