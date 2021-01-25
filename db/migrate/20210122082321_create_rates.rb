class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :rating
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
