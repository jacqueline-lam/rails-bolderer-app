class RemoveCustomStyleFromProblemStyles < ActiveRecord::Migration[6.0]
  def change
    remove_column :problem_styles, :custom_style, :string
  end
end
