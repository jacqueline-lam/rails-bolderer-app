class CreateProblemStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :problem_styles do |t|
      t.string :custom_style
      t.integer :problem_id
      t.integer :style_id

      t.timestamps
    end
  end
end
