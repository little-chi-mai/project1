class CreateListsRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :lists_recipes do |t|
      t.integer :list_id
      t.integer :recipe_id
    end
  end
end
