class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.text :name
      t.integer :prep_time
      t.text :prep_time_unit
      t.integer :cooking_time
      t.text :cooking_time_unit
      t.integer :difficulty
      t.text :course
      t.integer :serving
      t.text :content
      t.text :image
      t.integer :country_id
      t.integer :user_id

      t.timestamps
    end
  end
end
