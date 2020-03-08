class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.string :name
      t.string :color
      t.string :grade
      t.integer :points
      t.string :image
      t.integer :wall_id

      t.timestamps
    end
  end
end
