class AddImagesToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :images, :text, :array => true, :default => []
  end
end
