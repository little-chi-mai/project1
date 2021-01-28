class AddAverageRateToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :average_rate, :float
  end
end
