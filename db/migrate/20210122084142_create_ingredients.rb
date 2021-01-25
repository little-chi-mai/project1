class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.text :name
      t.float :amount
      t.text :unit

      t.timestamps
    end
  end
end
