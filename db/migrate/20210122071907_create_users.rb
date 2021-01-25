class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email
      t.text :name
      t.text :nationality
      t.date :dob
      t.text :about
      t.text :image
    end
  end
end
