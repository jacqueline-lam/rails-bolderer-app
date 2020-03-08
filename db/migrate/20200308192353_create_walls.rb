class CreateWalls < ActiveRecord::Migration[6.0]
  def change
    create_table :walls do |t|
      t.string :name

      t.timestamps
    end
  end
end
