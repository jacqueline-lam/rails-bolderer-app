class CreateSends < ActiveRecord::Migration[6.0]
  def change
    create_table :sends do |t|
      t.integer :attempts
      t.date :date_sent
      t.string :image
      t.integer :user_id
      t.integer :problem_id

      t.timestamps
    end
  end
end
