class RemoveTotalPointsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :total_points, :integer
  end
end
