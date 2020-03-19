class AddFavroriteToSends < ActiveRecord::Migration[6.0]
  def change
    add_column :sends, :favorite, :boolean, null: false, default: false
  end
end
