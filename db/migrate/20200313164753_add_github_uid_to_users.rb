class AddGithubUidToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :github_uid, :integer
  end
end
