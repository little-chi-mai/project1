class AddOriginToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :origin, :text
  end
end
