class RemovePointsFromProblems < ActiveRecord::Migration[6.0]
  def change
    remove_column :problems, :points, :integer
  end
end
